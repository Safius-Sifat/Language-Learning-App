import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:language_learning_app/src/common/primary_button.dart';
import 'package:language_learning_app/src/constants/app_sizes.dart';
import 'package:language_learning_app/src/constants/constants.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../routing/app_router.dart';
import '../../data/classroom_repository.dart';
import '../../domain/classroom.dart';
import 'class_card.dart';

class AllClassroomScreen extends ConsumerWidget {
  const AllClassroomScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final classrooms = ref.watch(classroomsProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Classrooms'),
        ),
        body: Padding(
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
                              // ref.read(classroomProvider.notifier).createClassroom(Classroom.empty());
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

                    // return ListTile(
                    //   title: Text(classroomList[index].name),
                    //   subtitle: Text(classroomList[index].description),
                    //   onTap: () {
                    //     // ref.read(classroomProvider.notifier).deleteClassroom(index);
                    //   },
                    // );
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
                  enabled: true,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ClassCard(classroom: Classroom.empty());
                      },
                      separatorBuilder: (context, index) => gapH12,
                      itemCount: 10))),
        ));
  }
}
