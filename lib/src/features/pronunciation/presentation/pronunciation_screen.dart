import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:language_learning_app/src/features/auth/repository/auth_repository.dart';
import 'package:language_learning_app/src/features/pronunciation/domain/pronunciation_model.dart';
import 'package:language_learning_app/src/features/pronunciation/presentation/audio_recorder_controller.dart';
import 'package:language_learning_app/src/features/pronunciation/presentation/create_challenge/create_pronunciation_screen.dart';
import 'package:language_learning_app/src/features/pronunciation/presentation/create_challenge/pronunciation_controller.dart';
import 'package:language_learning_app/src/features/vocabulary/domain/vocabulary_model.dart';
import 'package:language_learning_app/src/utils/toastification.dart';
import 'package:collection/collection.dart';

import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';
import '../../../constants/string_constants.dart';
import 'audio_player.dart';
import 'audio_recorder.dart';

class PronunciationScreen extends ConsumerStatefulWidget {
  const PronunciationScreen({super.key, required this.pronunciation});
  final PronunciationModel pronunciation;

  @override
  ConsumerState<PronunciationScreen> createState() =>
      _PronunciationScreenState();
}

class _PronunciationScreenState extends ConsumerState<PronunciationScreen> {
  User? get user => ref.read(authRepositoryProvider).currentUser;

  Participant? get me => widget.pronunciation.participants
      .firstWhereOrNull((people) => people.id == user!.uid);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.pronunciation.name,
        ),
      ),
      body: Column(
        children: [
          gapH20,
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: Sizes.p12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.p12),
              border: Border.all(
                color: Colors.grey.shade300,
              ),
            ),
            child: Column(
              children: [
                Text(
                  pronunciationConstants[widget.pronunciation.textIndex],
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'See Translation',
                    style: TextStyle(
                      color: kBlueColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                gapH16,
                AudioPlayer(
                  fromNetwork: true,
                  downloadUrl: widget.pronunciation.audioUrl,
                ),
              ],
            ),
          ),
          if (me == null)
            AudioRecorder(onUpload: () async {
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
                  .read(markPronunciationCompleteProvider.notifier)
                  .markPronunciationComplete(
                      filePath: filePath, postId: widget.pronunciation.id!);

              context.pop();
              if (success) {
                successToast(ctx: context, title: 'Marked complete');
              }
            })
          else
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
                    child: AudioPlayer(
                      fromNetwork: true,
                      downloadUrl: me!.audioUrl,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
