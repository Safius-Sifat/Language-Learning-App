import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:language_learning_app/src/app.dart';
import 'package:language_learning_app/src/constants/string_constants.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../routing/app_router.dart';

class SelectPronunciationScreen extends ConsumerStatefulWidget {
  const SelectPronunciationScreen({super.key, required this.classroomId});
  final String classroomId;

  @override
  ConsumerState<SelectPronunciationScreen> createState() =>
      _SelectPronunciationScreenState();
}

class _SelectPronunciationScreenState
    extends ConsumerState<SelectPronunciationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _deadlineController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  int? _selectedText;

  @override
  void dispose() {
    _nameController.dispose();
    _deadlineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select'),
        backgroundColor: Colors.white,
        actions: [
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.goNamed(AppRoute.createPronunciation.name,
                    pathParameters: {
                      'name': _nameController.text,
                      'deadline': _deadlineController.text,
                      'text': _selectedText.toString(),
                      'classroomId': widget.classroomId,
                    });
              }
            },
            child: const Text('Next'),
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
                  },
                ),
                gapH16,
                const Text(
                  'Select Text',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ...List.generate(pronunciationConstants.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedText = index;
                        });
                        // context.goNamed(AppRoute.recordPronunciation.name,
                        //     pathParameters: {'text': index.toString()});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Sizes.p12),
                          border: Border.all(
                            color: _selectedText == index
                                ? MyApp.primaryColor
                                : Colors.grey.shade300,
                          ),
                        ),
                        child: Text(pronunciationConstants[index]),
                      ),
                    ),
                  );
                }),
                // ListView.separated(
                //   physics: const NeverScrollableScrollPhysics(),
                //   itemBuilder: (context, index) {
                //   },
                //   separatorBuilder: (context, index) {
                //     return gapH12;
                //   },
                //   itemCount: pronunciationConstants.length,
                // ),
                gapH16,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
