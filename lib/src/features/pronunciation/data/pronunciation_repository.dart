import 'dart:math';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../presentation/audio_recorder_controller.dart';

part 'pronunciation_repository.g.dart';

class PronunciationRepository {
  final Dio _dio;
  const PronunciationRepository(Dio dio) : _dio = dio;
  Future<String> getAudioFromNetwork(Ref ref, [String? downloadUrl]) async {
    final dir = await getApplicationDocumentsDirectory();
    final random = Random();

    final digit = random.nextDouble();

    final path = '${dir.path}/audio$digit.mp3';

    await _dio.download(downloadUrl!, path,
        onReceiveProgress: (received, total) {
      print('received: $received, total: $total');
      ref
          .read(downloadPercentageProvider.notifier)
          .update(received / total * 100);
    });

    return path;
  }

  Future<void> preparePlayer(String path, PlayerController controller) async {
    return controller.preparePlayer(
      path: path,
      volume: 1,
      noOfSamples: 200,
    );
  }

  Future<void> play(PlayerController controller) async {
    await controller.startPlayer(finishMode: FinishMode.loop);
  }

  Future<void> pause(PlayerController controller) async {
    await controller.pausePlayer();
  }

  Future<void> stop(PlayerController controller) async {
    await controller.stopPlayer();
  }

  Future<int> getDuration(PlayerController controller) async {
    final value = await controller.getDuration(DurationType.current);
    return value;
  }

  Stream<PlayerState> onPlayerStateChanged(PlayerController controller) {
    return controller.onPlayerStateChanged;
  }
}

@riverpod
PronunciationRepository pronunciationRepository(
    PronunciationRepositoryRef ref) {
  final dio = ref.read(dioProvider);
  return PronunciationRepository(dio);
}

@riverpod
Future<void> getAudioFromAssets(
    GetAudioFromAssetsRef ref, PlayerController controller, bool fromAsset,
    {String? downloadUrl}) async {
  late final String path;
  if (fromAsset) {
    path = await ref
        .read(pronunciationRepositoryProvider)
        .getAudioFromNetwork(ref, downloadUrl);
  } else {
    final value = ref.read(audioRecorderControllerProvider).valueOrNull;
    if (value == null) {
      throw Exception('Record failed');
    }
    path = value;
  }
  return ref
      .read(pronunciationRepositoryProvider)
      .preparePlayer(path, controller);
}

@riverpod
Stream<PlayerState> playerState(
    PlayerStateRef ref, PlayerController controller) {
  return ref
      .read(pronunciationRepositoryProvider)
      .onPlayerStateChanged(controller);
}

@riverpod
Future<int> getAudioDuration(
    GetAudioDurationRef ref, PlayerController controller) {
  return ref.read(pronunciationRepositoryProvider).getDuration(controller);
}

@riverpod
Dio dio(DioRef ref) {
  return Dio();
}

@riverpod
class DownloadPercentage extends _$DownloadPercentage {
  @override
  double build() {
    return 0.0;
  }

  void update(double value) {
    state = value;
  }
}
