import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:language_learning_app/src/features/auth/repository/auth_repository.dart';
import 'package:language_learning_app/src/features/class/presentation/classroom_controller.dart';
import 'package:language_learning_app/src/utils/async_value_ui.dart';
import 'package:language_learning_app/src/utils/toastification.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../routing/app_router.dart';
import '../../data/classroom_repository.dart';
import '../../domain/classroom.dart';

class ClassCard extends ConsumerWidget {
  const ClassCard({super.key, required this.classroom});
  final Classroom classroom;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(authRepositoryProvider).currentUser;

    ref.listen<AsyncValue<dynamic>>(
      deleteClassroomProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    ref.listen<AsyncValue<dynamic>>(
      leaveClassroomProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    return InkWell(
      onTap: () {
        context.goNamed(AppRoute.posts.name, extra: classroom);
      },
      borderRadius: BorderRadius.circular(Sizes.p12),
      splashColor: Colors.white70,
      child: Container(
        height: 130,
        width: double.infinity,
        padding: const EdgeInsets.all(Sizes.p8),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(classroom.photoUrl),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(Sizes.p12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  classroom.name,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                PopupMenuButton(
                  iconColor: Colors.white,
                  itemBuilder: (context) {
                    return [
                      if (currentUser?.uid == classroom.teacherId)
                        PopupMenuItem(
                          child: const Text('Delete'),
                          onTap: () async {
                            final success = await ref
                                .read(deleteClassroomProvider.notifier)
                                .deleteClassroom(classroom.id!);
                            if (success) {
                              ref.invalidate(classroomsProvider);

                              successToast(
                                  ctx: context, title: 'Classroom deleted');
                            }
                          },
                        ),
                      if (currentUser?.uid != classroom.teacherId)
                        PopupMenuItem(
                          child: const Text('Leave'),
                          onTap: () async {
                            final success = await ref
                                .read(leaveClassroomProvider.notifier)
                                .leaveClassroom(classroom.id!);
                            if (success) {
                              ref.invalidate(classroomsProvider);
                              successToast(
                                  ctx: context, title: 'Left from the class');
                            }
                          },
                        ),
                    ];
                  },
                ),
              ],
            ),
            SizedBox(
              width: 200,
              child: Text(classroom.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w400)),
            ),
            const Spacer(),
            Text(
                currentUser?.uid == classroom.teacherId
                    ? '${classroom.students.length} students'
                    : classroom.teacherName,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
