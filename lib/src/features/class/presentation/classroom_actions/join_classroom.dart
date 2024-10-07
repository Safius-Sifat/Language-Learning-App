import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:language_learning_app/src/common/overlay_loader.dart';
import 'package:language_learning_app/src/constants/app_sizes.dart';
import 'package:language_learning_app/src/features/class/data/classroom_repository.dart';
import 'package:language_learning_app/src/utils/async_value_ui.dart';
import 'package:language_learning_app/src/utils/toastification.dart';

import '../classroom_controller.dart';

class JoinClassroomScreen extends ConsumerStatefulWidget {
  const JoinClassroomScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _JoinClassroomScreenState();
}

class _JoinClassroomScreenState extends ConsumerState<JoinClassroomScreen> {
  final TextEditingController _classCodeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _classCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<dynamic>>(
      joinClassroomProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join Class'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                  'Ask your teacher for the class code, then enter it here.'),
              gapH12,
              TextFormField(
                  controller: _classCodeController,
                  decoration: const InputDecoration(
                    labelText: 'Class Code',
                    hintText: 'Enter class code here',
                    border: OutlineInputBorder(),
                  ),
                  maxLength: 6,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a class code';
                    }
                    return null;
                  }),
              gapH24,
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    showOverlayLoader(context);
                    final success = await ref
                        .read(joinClassroomProvider.notifier)
                        .joinClassroom(_classCodeController.text);
                    context.pop();
                    if (success) {
                      ref.invalidate(classroomsProvider);
                      successToast(
                          ctx: context, title: 'Classroom join successful');
                      context.pop();
                    }
                  }
                },
                child: const Text('Join'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
