import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/app_sizes.dart';
import '../../../utils/async_value_ui.dart';
import '../data/recorder_repository.dart';
import 'audio_player.dart';
import 'audio_recorder_controller.dart';

class AudioRecorder extends ConsumerStatefulWidget {
  const AudioRecorder({super.key, required this.onUpload});
  final VoidCallback onUpload;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AudioRecorderState();
}

class _AudioRecorderState extends ConsumerState<AudioRecorder> {
  late final RecorderController _recorderController;

  @override
  void initState() {
    super.initState();
    _recorderController = RecorderController()
      ..androidEncoder = AndroidEncoder.aac
      ..androidOutputFormat = AndroidOutputFormat.mpeg4
      ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
      ..sampleRate = 44100;
  }

  @override
  void dispose() {
    _recorderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final duration = ref.watch(recordingDurationProvider(_recorderController));
    // final playerState = ref.watch(playerStateProvider(_playerController));
    //
    ref.listen<AsyncValue<dynamic>>(
      audioRecorderControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    return ref.watch(recorderStateProvider(_recorderController)).when(
          data: (value) {
            if (value == RecorderState.recording) {
              return Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    duration.when(
                      data: (value) =>
                          Text('Recording Voice ${value.toHHMMSS()}'),
                      loading: () => const Text('Recording Voice '),
                      error: (error, _) => Text('Error: $error'),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: Sizes.p16),
                      child: AudioWaveforms(
                        size: Size(MediaQuery.of(context).size.width, 70),
                        recorderController: _recorderController,
                        enableGesture: true,
                        waveStyle: WaveStyle(
                          waveColor: Theme.of(context).colorScheme.primary,
                          extendWaveform: true,
                          showMiddleLine: false,
                        ),
                      ),
                    ),
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey.withOpacity(0.3),
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () async {
                        if (value == RecorderState.recording) {
                          await ref
                              .read(audioRecorderControllerProvider.notifier)
                              .stop(_recorderController);
                        } else {
                          await ref
                              .read(audioRecorderControllerProvider.notifier)
                              .record(_recorderController);
                        }
                      },
                      label: value == RecorderState.recording
                          ? const Text('Stop ')
                          : const Text('Start '),
                      icon: value == RecorderState.recording
                          ? const Icon(Icons.stop)
                          : const Icon(Icons.mic),
                    ),
                    gapH48,
                  ],
                ),
              );
            } else if (value == RecorderState.stopped) {
              return Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: Sizes.p16),
                      child: AudioPlayer(
                        fromNetwork: false,
                      ),
                    ),
                    gapH24,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(flex: 2),
                        TextButton.icon(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.grey.withOpacity(0.3),
                            foregroundColor: Colors.black,
                          ),
                          onPressed: widget.onUpload,
                          icon: const Icon(Icons.upload_rounded),
                          label: const Text('Upload'),
                        ),
                        gapW16,
                        IconButton(
                          onPressed: () async {
                            await ref
                                .read(audioRecorderControllerProvider.notifier)
                                .record(_recorderController);
                          },
                          icon: const Icon(Icons.restart_alt_outlined),
                        ),
                        const Spacer()
                      ],
                    ),
                  ],
                ),
              );
            }

            return Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton.icon(
                    onPressed: () async {
                      await ref
                          .read(audioRecorderControllerProvider.notifier)
                          .record(_recorderController);
                    },
                    icon: const Icon(Icons.mic),
                    label: const Text('Tap to record voice'),
                  ),
                  gapH48,
                ],
              ),
            );
          },
          loading: () => Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () async {
                    await ref
                        .read(audioRecorderControllerProvider.notifier)
                        .record(_recorderController);
                  },
                  icon: const Icon(Icons.mic),
                  label: const Text('Tap to record voice'),
                ),
                gapH48,
              ],
            ),
          ),
          error: (error, _) => Text('Error: $error'),
        );
    // return ref.watch(getAudioFromAssetsProvider(_playerController)).when(
    //       data: (value) {
    //         return Column(
    //           children: [
    //             duration.when(
    //               data: (value) => Text('Total Length: $value'),
    //               loading: () => const Text('Total Length: Loading...'),
    //               error: (error, _) => Text('Error: $error'),
    //             ),
    //             AudioFileWaveforms(
    //               size: Size(MediaQuery.of(context).size.width, 70),
    //               playerController: _playerController,
    //               playerWaveStyle: PlayerWaveStyle(
    //                 liveWaveColor: Theme.of(context).colorScheme.primary,
    //                 fixedWaveColor: Colors.grey,
    //                 spacing: 6,
    //               ),
    //             ),
    //             playerState.when(
    //               data: (value) => IconButton.filled(
    //                   style: IconButton.styleFrom(
    //                     foregroundColor: Theme.of(context).colorScheme.primary,
    //                     backgroundColor: Theme.of(context)
    //                         .colorScheme
    //                         .primary
    //                         .withOpacity(0.3),
    //                   ),
    //                   onPressed: () async {
    //                     if (value == PlayerState.playing) {
    //                       await ref
    //                           .read(audioControllerProvider.notifier)
    //                           .pause(_playerController);
    //                     } else {
    //                       await ref
    //                           .read(audioControllerProvider.notifier)
    //                           .play(_playerController);
    //                     }
    //                   },
    //                   icon: value == PlayerState.playing
    //                       ? const Icon(
    //                           Icons.pause_circle_rounded,
    //                         )
    //                       : const Icon(
    //                           Icons.play_arrow_rounded,
    //                         )),
    //               loading: () => const Text('Player State: Loading...'),
    //               error: (error, _) => Text('Error: $error'),
    //             ),
    //           ],
    //         );
    //       },
    //       loading: () => const CircularProgressIndicator(),
    //       error: (error, _) => Text('Error: $error'),
    //     );
  }
}
