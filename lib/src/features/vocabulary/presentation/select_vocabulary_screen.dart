import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:language_learning_app/src/app.dart';
import 'package:language_learning_app/src/common/overlay_loader.dart';
import 'package:language_learning_app/src/features/vocabulary/presentation/vocabulary_controller.dart';
import 'package:language_learning_app/src/utils/async_value_ui.dart';
import 'package:language_learning_app/src/utils/toastification.dart';

import '../../../constants/app_sizes.dart';
import '../../../constants/vocabulary_constants.dart';

class SelectVocabularyScreen extends ConsumerStatefulWidget {
  const SelectVocabularyScreen({super.key, required this.classroomId});
  final String classroomId;

  @override
  ConsumerState<SelectVocabularyScreen> createState() =>
      _SelectPronunciationScreenState();
}

class _SelectPronunciationScreenState
    extends ConsumerState<SelectVocabularyScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _deadlineController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final List<int> _selectedTexts = [];

  @override
  void dispose() {
    _nameController.dispose();
    _deadlineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<dynamic>>(
      createVocabularyChallengeProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select'),
        backgroundColor: Colors.white,
        actions: [
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                showOverlayLoader(context);
                final success = await ref
                    .read(createVocabularyChallengeProvider.notifier)
                    .createVocabularyAssignment(
                        name: _nameController.text,
                        vocabualries: _selectedTexts,
                        deadline: _deadlineController.text,
                        classroomId: widget.classroomId);
                context.pop();
                if (success) {
                  successToast(
                      ctx: context, title: 'Vocabulary posted successfully');
                }
              }
            },
            child: const Text('Post'),
          ),
          gapW12,
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                gapH16,
                const Text(
                  'Select Vocabulary',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ...List.generate(vocabularyConstants.length, (index) {
                  return ListTile(
                    title: Text(
                      '${vocabularyConstants[index].word} - ${vocabularyConstants[index].meaning}',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      vocabularyConstants[index].description,
                    ),
                    selected: _selectedTexts.contains(index),
                    selectedTileColor: MyApp.primaryColor.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    onTap: () {
                      if (_selectedTexts.contains(index)) {
                        _selectedTexts.remove(index);
                      } else {
                        _selectedTexts.add(index);
                      }
                      setState(() {});
                    },
                  );
                }),
                gapH12,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
