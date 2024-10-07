import 'package:language_learning_app/src/features/pronunciation/data/upload_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'pronunciation_controller.g.dart';

@riverpod
class CreatePronunciationChallenge extends _$CreatePronunciationChallenge {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<bool> createPronunciationAssignment(
      {required String name,
      required String deadline,
      required String filePath,
      required int textIndex,
      required String classroomId}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        return ref.read(uploadRepositoryProvider).createPronunciationAssignment(
            name: name,
            deadline: deadline,
            filePath: filePath,
            textIndex: textIndex,
            classroomId: classroomId);
      },
    );
    return !state.hasError;
  }
}
