import 'package:flutter/material.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:language_learning_app/src/constants/app_sizes.dart';
import 'package:language_learning_app/src/constants/constants.dart';

import '../../../pronunciation/presentation/audio_player.dart';
import '../../../vocabulary/domain/vocabulary_model.dart';

class ParticipantScreen extends ConsumerWidget {
  const ParticipantScreen({super.key, required this.participants});
  final List<Participant> participants;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Participants'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: participants.isEmpty
            ? Column(
                children: [
                  const Spacer(),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(Sizes.p24),
                    child: SvgPicture.asset(kNoStudent),
                  )),
                  Expanded(
                    child: Text(
                      'No participants yet',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const Spacer(),
                ],
              )
            : ListView.separated(
                itemBuilder: (context, index) {
                  if (participants[index].audioUrl == null) {
                    return ListTile(
                      leading: Initicon(
                        text: participants[index].name ??
                            participants[index].email,
                        size: 32,
                      ),
                      title: Text(participants[index].name ??
                          participants[index]
                              .email), //   shape: RoundedRectangleBorder(
                    );
                  }

                  return Container(
                    padding: const EdgeInsets.all(Sizes.p12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.p12),
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Initicon(
                              text: participants[index].name ??
                                  participants[index].email,
                              size: 32,
                            ),
                            gapW8,
                            Text(
                                participants[index].name ??
                                    participants[index].email,
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                        gapH12,
                        AudioPlayer(
                            fromNetwork: true,
                            downloadUrl: participants[index].audioUrl!)
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: participants.length),
      ),
    );
  }
}
