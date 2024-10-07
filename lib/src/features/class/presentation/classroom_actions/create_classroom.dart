import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:language_learning_app/src/common/overlay_loader.dart';
import 'package:language_learning_app/src/constants/app_sizes.dart';
import 'package:language_learning_app/src/features/auth/repository/auth_repository.dart';
import 'package:language_learning_app/src/features/class/presentation/classroom_controller.dart';
import 'package:language_learning_app/src/utils/async_value_ui.dart';

import '../../../../utils/generate_random_code.dart';
import '../../../../utils/toastification.dart';
import '../../data/classroom_repository.dart';
import '../../domain/classroom.dart';

class CreateClassroomScreen extends ConsumerStatefulWidget {
  const CreateClassroomScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateClassroomScreenState();
}

class _CreateClassroomScreenState extends ConsumerState<CreateClassroomScreen> {
  final TextEditingController _classNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _classNameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<dynamic>>(
      createClassroomProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    // final state = ref.watch(createClassroomProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Classroom'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
          child: Column(
            children: [
              gapH12,
              TextFormField(
                  controller: _classNameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter class name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a class name';
                    }
                    return null;
                  }),
              gapH12,
              TextFormField(
                  controller: _descriptionController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    hintText: 'Enter class description here',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a class name';
                    }
                    return null;
                  }),
              gapH24,
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final user = ref.read(authRepositoryProvider).currentUser;
                    if (user == null) {
                      errorToast(
                        ctx: context,
                        title: 'Error',
                        description: 'Please login to create a classroom',
                      );
                      return;
                    }
                    int randomNumber = Random(10000).nextInt(3) + 1;
                    final code = generateRandomCode();

                    final classroom = Classroom(
                      name: _classNameController.text,
                      description: _descriptionController.text,
                      createdAt: DateTime.now(),
                      teacherId: user.uid,
                      code: code,
                      teacherName: user.displayName ?? user.email!,
                      students: [],
                      photoUrl: 'assets/back-$randomNumber.jpg',
                    );
                    showOverlayLoader(context);
                    final success = await ref
                        .read(createClassroomProvider.notifier)
                        .createClassroom(classroom);
                    context.pop();
                    if (success) {
                      ref.invalidate(classroomsProvider);
                      successToast(ctx: context, title: 'Classroom created');
                      context.pop();
                    }
                  }
                },
                child: const Text('Create'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
