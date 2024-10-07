import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'recorder_repository.g.dart';

class RecorderRepository {
  Future<String?> startRecording(RecorderController controller) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/aud.mp3';
    final hasPermission = await controller.checkPermission();
    if (hasPermission) {
      await controller.record(path: path);
    } else {
      throw Exception('Microphone permission is denied');
    }
    return null;
  }

  Future<String?> stopRecording(RecorderController controller) async {
    final path = await controller.stop();
    print(path);
    return path;
  }
}

@riverpod
RecorderRepository recorderRepository(RecorderRepositoryRef ref) {
  return RecorderRepository();
}

@riverpod
Stream<RecorderState> recorderState(
    RecorderStateRef ref, RecorderController controller) {
  return controller.onRecorderStateChanged;
}

@riverpod
Stream<Duration> recordingDuration(
    RecordingDurationRef ref, RecorderController controller) {
  return controller.onCurrentDuration;
}

@riverpod
Duration finalRecordedDuration(
    FinalRecordedDurationRef ref, RecorderController controller) {
  return controller.recordedDuration;
}
