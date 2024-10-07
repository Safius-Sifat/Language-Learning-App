import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:language_learning_app/src/features/pronunciation/domain/pronunciation_model.dart';

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
                  fromAsset: true,
                  downloadUrl: widget.pronunciation.audioUrl,
                ),
              ],
            ),
          ),
          AudioRecorder(onUpload: () {}),
        ],
      ),
    );
  }
}
