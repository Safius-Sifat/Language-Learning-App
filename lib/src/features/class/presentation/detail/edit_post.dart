import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:language_learning_app/src/common/overlay_loader.dart';
import 'package:language_learning_app/src/constants/app_sizes.dart';
import 'package:language_learning_app/src/features/class/presentation/classroom_controller.dart';
import 'package:language_learning_app/src/features/vocabulary/presentation/vocabulary_controller.dart';
import 'package:language_learning_app/src/utils/async_value_ui.dart';

import '../../../../utils/toastification.dart';

class EditPostScreen extends ConsumerStatefulWidget {
  const EditPostScreen({
    super.key,
    required this.postId,
    required this.name,
    required this.deadline,
  });
  final String postId;
  final String name;
  final String deadline;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateClassroomScreenState();
}

class _CreateClassroomScreenState extends ConsumerState<EditPostScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _deadlineController;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(text: widget.name);
    _deadlineController = TextEditingController(text: widget.deadline);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _deadlineController.dispose();
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
        title: const Text('Edit'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
          child: Column(
            children: [
              gapH12,
              TextFormField(
                  controller: _nameController,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter challenge name',
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
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2025),
                    );
                    if (selectedDate != null) {
                      _deadlineController.text =
                          selectedDate.toIso8601String().split('T').first;
                    }
                  },
                  readOnly: true,
                  controller: _deadlineController,
                  decoration: const InputDecoration(
                    labelText: 'Select deadline',
                    hintText: 'Enter deadline date',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Deadline cannot be empty';
                    }
                    return null;
                  }),
              gapH24,
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    showOverlayLoader(context);
                    final success = await ref
                        .read(editPostProvider.notifier)
                        .edit(
                            postId: widget.postId,
                            deadline: _deadlineController.text,
                            name: _nameController.text);
                    context.pop();
                    if (success) {
                      successToast(ctx: context, title: 'Post updated');
                      context.pop();
                    }
                  }
                },
                child: const Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
