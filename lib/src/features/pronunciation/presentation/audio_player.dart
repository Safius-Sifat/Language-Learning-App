import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:language_learning_app/src/constants/app_sizes.dart';

import '../../../utils/async_value_ui.dart';
import '../data/pronunciation_repository.dart';
import 'audio_player_controller.dart';

class AudioPlayer extends ConsumerStatefulWidget {
  const AudioPlayer({super.key, required this.fromNetwork, this.downloadUrl});

  final bool fromNetwork;
  final String? downloadUrl;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AudioPlayerState();
}

class _AudioPlayerState extends ConsumerState<AudioPlayer> {
  late final PlayerController _playerController;

  @override
  void initState() {
    super.initState();
    _playerController = PlayerController();
  }

  @override
  void dispose() {
    _playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final duration = ref.watch(getAudioDurationProvider(_playerController));
    final playerState = ref.watch(playerStateProvider(_playerController));
    final downloadPercentage =
        ref.watch(downloadPercentageProvider(widget.downloadUrl ?? ''));

    ref.listen<AsyncValue<dynamic>>(
      audioControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    return ref
        .watch(getAudioFromAssetsProvider(_playerController, widget.fromNetwork,
            downloadUrl: widget.downloadUrl))
        .when(
          data: (value) {
            return Column(
              children: [
                duration.when(
                  data: (val) => Text('Total Length: $val'),
                  loading: () => const Text('Total Length: 1:24'),
                  error: (error, _) => Text('Error: $error'),
                ),
                AudioFileWaveforms(
                  size: Size(MediaQuery.of(context).size.width, 70),
                  playerController: _playerController,
                  playerWaveStyle: PlayerWaveStyle(
                    liveWaveColor: Theme.of(context).colorScheme.primary,
                    fixedWaveColor: Colors.grey,
                    spacing: 6,
                  ),
                ),
                playerState.when(
                  data: (value) => IconButton.filled(
                      style: IconButton.styleFrom(
                        foregroundColor: Theme.of(context).colorScheme.primary,
                        backgroundColor: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.3),
                      ),
                      onPressed: () async {
                        if (value == PlayerState.playing) {
                          await ref
                              .read(audioControllerProvider.notifier)
                              .pause(_playerController);
                        } else {
                          await ref
                              .read(audioControllerProvider.notifier)
                              .play(_playerController);
                        }
                      },
                      icon: value == PlayerState.playing
                          ? const Icon(
                              Icons.pause_circle_rounded,
                            )
                          : const Icon(
                              Icons.play_arrow_rounded,
                            )),
                  loading: () => const Text('Player State: Loading...'),
                  error: (error, _) => Text('Error: $error'),
                ),
              ],
            );
          },
          loading: () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('$downloadPercentage / 100 %'),
              gapH4,
              LinearProgressIndicator(
                value: downloadPercentage / 100,
                borderRadius: BorderRadius.circular(Sizes.p8),
              ),
              gapH4,
              const Text('loading..'),
            ],
          ),
          error: (error, _) => Text('Error: $error'),
        );
  }
}
