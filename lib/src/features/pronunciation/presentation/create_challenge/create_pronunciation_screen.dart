import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:language_learning_app/src/features/pronunciation/presentation/create_challenge/pronunciation_controller.dart';
import 'package:language_learning_app/src/features/video/presentation/video_controller.dart';
import 'package:language_learning_app/src/utils/toastification.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/string_constants.dart';
import '../audio_recorder.dart';
import '../audio_recorder_controller.dart';

class CreatePronunciationScreen extends ConsumerWidget {
  const CreatePronunciationScreen(
      {super.key,
      required this.text,
      required this.name,
      required this.deadline,
      required this.classroomId});

  final String text;
  final String name;
  final String deadline;
  final String classroomId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            context.pop();
          },
        ),
        title: const Text('Create Pronunciation Challenge',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: Sizes.p16,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Divider(
            height: 1,
            color: Colors.grey.shade300,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(Sizes.p16),
              child: Text(
                'Selected Text',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: Sizes.p12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.p12),
              border: Border.all(
                color: Colors.grey.shade300,
              ),
            ),
            child: Text(pronunciationConstants[int.parse(text)]),
          ),
          AudioRecorder(
            onUpload: () async {
              final filePath =
                  ref.read(audioRecorderControllerProvider).valueOrNull;
              if (filePath == null) {
                errorToast(
                    ctx: context,
                    title: 'Upload failed',
                    description: 'No file found');
                return;
              }

              showUploadingDialog(context, ref);
              final success = await ref
                  .read(createPronunciationChallengeProvider.notifier)
                  .createPronunciationAssignment(
                      name: name,
                      deadline: deadline,
                      filePath: filePath,
                      textIndex: int.parse(text),
                      classroomId: classroomId);

              context.pop();
              if (success) {
                successToast(
                    ctx: context, title: 'Pronunciation posted successfully');
              }
            },
          ),
        ],
      ),
    );
  }
}

void showUploadingDialog(BuildContext context, WidgetRef ref) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      final state = ref.watch(createPronunciationChallengeProvider);
      return Dialog(
        child: state.when(
          data: (_) => SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Upload complete'),
                gapH16,
                ElevatedButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: const Text('OK')),
              ],
            ),
          ),
          loading: () => SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Uploading...'),
                gapH16,
                const CircularProgressIndicator(),
                gapH8,
                TextButton(
                    onPressed: () {
                      ref.invalidate(createPronunciationChallengeProvider);
                      ref.invalidate(createVideoChallengeProvider);
                      context.pop();
                    },
                    child: const Text('Cancel')),
              ],
            ),
          ),
          error: (error, _) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Error: $error'),
              gapH16,
              ElevatedButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text('OK')),
            ],
          ),
        ),
      );
    },
  );
}
