import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:language_learning_app/src/features/auth/repository/auth_repository.dart';
import 'package:language_learning_app/src/features/class/presentation/classroom_controller.dart';
import 'package:language_learning_app/src/utils/async_value_ui.dart';
import 'package:language_learning_app/src/utils/toastification.dart';

import '../../../../constants/app_sizes.dart';
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

    return InkWell(
      onTap: () {
        // ref.read(classroomProvider.notifier).deleteClassroom(classroom.id);
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
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: const Text('Delete'),
                        onTap: () async {
                          final success = await ref
                              .read(deleteClassroomProvider.notifier)
                              .deleteClassroom(classroom.id!);
                          if (success) {
                            successToast(
                                ctx: context, title: 'Classroom deleted');
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
