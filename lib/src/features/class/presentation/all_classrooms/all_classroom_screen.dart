import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:language_learning_app/src/common/primary_button.dart';
import 'package:language_learning_app/src/constants/app_sizes.dart';
import 'package:language_learning_app/src/constants/constants.dart';
import 'package:language_learning_app/src/features/auth/controller/auth_controller.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../app.dart';
import '../../../../routing/app_router.dart';
import '../../../auth/repository/auth_repository.dart';
import '../../data/classroom_repository.dart';
import '../../domain/classroom.dart';
import 'class_card.dart';

class AllClassroomScreen extends ConsumerStatefulWidget {
  const AllClassroomScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AllClassroomScreenState();
}

class _AllClassroomScreenState extends ConsumerState<AllClassroomScreen> {
  @override
  void initState() {
    super.initState();

    SystemChannels.lifecycle.setMessageHandler((message) {
      debugPrint('Message: $message');

      final currentUser = ref.read(authRepositoryProvider).currentUser;
      if (currentUser != null) {
        if (message.toString().contains('resume')) {
          ref.read(updateActiveStatusProvider.notifier).updateStatus(true);
        }
        if (message.toString().contains('pause')) {
          ref.read(updateActiveStatusProvider.notifier).updateStatus(false);
        }
      }

      return Future.value(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    final classrooms = ref.watch(classroomsProvider);
    final user = ref.watch(authRepositoryProvider).currentUser;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Classrooms'),
          actions: [
            if (user != null && user.photoURL != null)
              InkWell(
                onTap: () => context.goNamed(AppRoute.profile.name),
                child: CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(user.photoURL!),
                ),
              ),
            if (user == null || user.photoURL == null)
              InkWell(
                onTap: () => context.goNamed(AppRoute.profile.name),
                child: Initicon(
                    text: user?.displayName ?? user?.email ?? "",
                    // backgroundColor: Colors.blue,
                    size: 32.0),
              ),
            gapW12,
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          shape: const CircleBorder(),
          onPressed: () {
            showClassModalSheet(context);
          },
          child: const Icon(
            Icons.add,
            color: MyApp.primaryColor,
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await ref.refresh(classroomsProvider.future);
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: classrooms.when(
              skipLoadingOnRefresh: false,
              data: (classroomList) {
                if (classroomList.isEmpty) {
                  return Column(
                    children: [
                      const Spacer(),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            const Spacer(),
                            Expanded(
                                flex: 5, child: SvgPicture.asset(kNoClass)),
                            const Spacer(),
                          ],
                        ),
                      ),
                      gapH16,
                      const Text('Add a class to get started'),
                      gapH12,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                foregroundColor: kBlackColor,
                                backgroundColor: Colors.transparent),
                            onPressed: () {
                              context.goNamed(AppRoute.joinClassroom.name);
                            },
                            child: const Text('Join Class'),
                          ),
                          gapW20,
                          ElevatedButton(
                            onPressed: () {
                              context.goNamed(AppRoute.createClassroom.name);
                            },
                            child: const Text('Create Class'),
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  );
                }
                return ListView.separated(
                  itemCount: classroomList.length,
                  separatorBuilder: (context, index) => gapH12,
                  itemBuilder: (context, index) {
                    return ClassCard(classroom: classroomList[index]);
                  },
                );
              },
              error: (e, st) => Column(
                children: [
                  const Spacer(),
                  Expanded(
                    child: Row(
                      children: [
                        const Spacer(),
                        Expanded(flex: 5, child: SvgPicture.asset(kError)),
                        const Spacer(),
                      ],
                    ),
                  ),
                  Text(e.toString()),
                  Text(st.toString()),
                  // const Text('Oops! Something went wrong'),
                  gapH24,
                  PrimaryButton(
                    height: Sizes.p48,
                    width: 300,
                    onPressed: () {
                      ref.invalidate(classroomsProvider);
                    },
                    text: 'Retry',
                  ),
                  const Spacer()
                ],
              ),
              loading: () => Skeletonizer(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ClassCard(classroom: Classroom.empty());
                    },
                    separatorBuilder: (context, index) => gapH12,
                    itemCount: 6),
              ),
            ),
          ),
        ));
  }
}

void showClassModalSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 130,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Sizes.p12),
                  topRight: Radius.circular(Sizes.p12))),
          child: Column(
            children: [
              ListTile(
                title: const Text('Join Class'),
                leading: const Icon(Icons.join_full),
                onTap: () {
                  context.pop();
                  context.goNamed(AppRoute.joinClassroom.name);
                },
              ),
              ListTile(
                title: const Text('Create Class'),
                leading: const Icon(Icons.add),
                onTap: () {
                  context.pop();
                  context.goNamed(AppRoute.createClassroom.name);
                },
              ),
            ],
          ),
        );
      });
}
