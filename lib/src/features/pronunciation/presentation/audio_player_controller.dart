import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/pronunciation_repository.dart';

part 'audio_player_controller.g.dart';

@riverpod
class AudioController extends _$AudioController {
  @override
  Future<void> build() async {}
  Future<void> play(PlayerController controller) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => ref.read(pronunciationRepositoryProvider).play(controller));
  }

  Future<void> pause(PlayerController controller) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => ref.read(pronunciationRepositoryProvider).pause(controller));
  }

  Future<void> stop(PlayerController controller) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => ref.read(pronunciationRepositoryProvider).stop(controller));
  }
}
