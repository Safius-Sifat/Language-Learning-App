import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/recorder_repository.dart';

part 'audio_recorder_controller.g.dart';

// enum RecorderState { initial, recording, stopped }

@riverpod
class AudioRecorderController extends _$AudioRecorderController {
  @override
  FutureOr<String?> build() async {
    return null;
  }

  Future<void> record(RecorderController controller) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => ref.read(recorderRepositoryProvider).startRecording(controller));
  }

  Future<void> stop(RecorderController controller) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(
        () => ref.read(recorderRepositoryProvider).stopRecording(controller));
  }
}
