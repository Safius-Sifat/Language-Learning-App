import 'package:flutter/material.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:language_learning_app/src/constants/app_sizes.dart';
import 'package:language_learning_app/src/constants/constants.dart';

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
        padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                  return ListTile(
                    leading: Initicon(
                      text:
                          participants[index].name ?? participants[index].email,
                    ),
                    title: Text(
                        participants[index].name ?? participants[index].email,
                        style: Theme.of(context).textTheme.titleMedium),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: participants.length),
      ),
    );
  }
}
