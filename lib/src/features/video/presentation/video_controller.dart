import 'package:language_learning_app/src/features/video/data/video_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'video_controller.g.dart';

@riverpod
class CreateVideoChallenge extends _$CreateVideoChallenge {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<bool> createVideoAssignment(
      {required String name,
      required String filePath,
      required String classroomId}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        return ref.read(videoUploadRepositoryProvider).uploadVideo(
            name: name, filePath: filePath, classroomId: classroomId);
      },
    );
    return !state.hasError;
  }
}
