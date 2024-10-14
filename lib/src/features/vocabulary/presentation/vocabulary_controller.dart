import 'package:language_learning_app/src/exception/app_exception.dart';
import 'package:language_learning_app/src/features/auth/repository/auth_repository.dart';
import 'package:language_learning_app/src/features/vocabulary/data/vocabulary_repository.dart';
import 'package:language_learning_app/src/features/vocabulary/domain/vocabulary_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'vocabulary_controller.g.dart';

@riverpod
class CreateVocabularyChallenge extends _$CreateVocabularyChallenge {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<bool> createVocabularyAssignment(
      {required String name,
      required List<int> vocabualries,
      required String deadline,
      required String classroomId}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        return ref
            .read(vocabularyRepositoryProvider)
            .createVocabularyAssignment(
                name: name,
                deadline: deadline,
                vocabularies: vocabualries,
                classroomId: classroomId);
      },
    );
    return !state.hasError;
  }
}

@riverpod
class VocabularyMarkComplete extends _$VocabularyMarkComplete {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<bool> markVocabularyComplete({required String postId}) async {
    final user = ref.read(authRepositoryProvider).currentUser;
    if (user == null) {
      throw UserNotFoundException;
    }
    final participant = Participant(
      id: user.uid,
      email: user.email!,
      name: user.displayName,
    );
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        return ref
            .read(vocabularyRepositoryProvider)
            .markComplete(participant: participant, postId: postId);
      },
    );
    return !state.hasError;
  }
}

@riverpod
class EditPost extends _$EditPost {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<bool> edit(
      {required String postId,
      required String name,
      required String deadline}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        return ref
            .read(vocabularyRepositoryProvider)
            .editPost(name: name, deadline: deadline, postId: postId);
      },
    );
    return !state.hasError;
  }
}
