import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:language_learning_app/src/common/overlay_loader.dart';
import 'package:language_learning_app/src/constants/app_sizes.dart';
import 'package:language_learning_app/src/features/auth/repository/auth_repository.dart';
import 'package:language_learning_app/src/utils/async_value_ui.dart';
import 'package:language_learning_app/src/utils/toastification.dart';

import '../../../constants/vocabulary_constants.dart';
import '../domain/vocabulary_model.dart';
import 'vocabulary_controller.dart';

class LearnVocabularyScreen extends ConsumerWidget {
  const LearnVocabularyScreen({super.key, required this.vocabulary});
  final VocabularyModel vocabulary;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    User? user = ref.read(authRepositoryProvider).currentUser;

    Participant? me = vocabulary.participants
        .firstWhereOrNull((people) => people.id == user!.uid);
    ref.listen<AsyncValue<dynamic>>(
      vocabularyMarkCompleteProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(vocabulary.name),
        actions: [
          ElevatedButton(
              onPressed: me != null
                  ? null
                  : () async {
                      showOverlayLoader(context);
                      final success = await ref
                          .read(vocabularyMarkCompleteProvider.notifier)
                          .markVocabularyComplete(postId: vocabulary.id!);
                      context.pop();

                      if (success) {
                        successToast(ctx: context, title: 'Marked as complete');
                      }
                    },
              child: const Text('Done')),
          gapW12,
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            final realIndex = vocabulary.vocabularies[index];
            return ListTile(
              title: Text(
                '${vocabularyConstants[realIndex].word} - ${vocabularyConstants[realIndex].meaning}',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                vocabularyConstants[realIndex].description,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: vocabulary.vocabularies.length),
    );
  }
}
