import 'package:flutter/material.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:language_learning_app/src/constants/app_sizes.dart';
import 'package:language_learning_app/src/features/auth/repository/auth_repository.dart';
import 'package:language_learning_app/src/features/class/domain/classroom.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ClassroomPeople extends ConsumerWidget {
  const ClassroomPeople({super.key, required this.classroom});
  final Classroom classroom;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final response = ref.watch(fetchUsersProvider(ids: classroom.students));
    return Scaffold(
      appBar: AppBar(
        title: const Text('People'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p12),
          child: Column(
            children: [
              const Text(
                'Teacher',
                style: TextStyle(fontSize: 20),
              ),
              const Divider(),
              Row(
                children: [
                  Initicon(text: classroom.teacherName, size: 32.0),
                  const SizedBox(width: 8),
                  Text(classroom.teacherName),
                ],
              ),
              const Text(
                'Students',
                style: TextStyle(fontSize: 20),
              ),
              const Divider(),
              response.when(
                data: (students) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: students
                      .map(
                        (student) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              if (student.photoUrl != null)
                                CircleAvatar(
                                  radius: 16,
                                  backgroundImage:
                                      NetworkImage(student.photoUrl!),
                                )
                              else
                                Initicon(
                                    text: student.name ?? student.email,
                                    size: 32.0),
                              gapW8,
                              Text(student.name ?? student.email),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
                loading: () => Skeletonizer(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      5,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey.shade300,
                              radius: 16,
                            ),
                            gapW8,
                            const Text('Anonymous'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                error: (error, _) => Text('Error: $error'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
