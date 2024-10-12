import 'package:language_learning_app/src/features/auth/repository/auth_repository.dart';
import 'package:language_learning_app/src/features/class/data/classroom_repository.dart';
import 'package:language_learning_app/src/features/class/domain/classroom.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../exception/app_exception.dart';

part 'classroom_controller.g.dart';

@riverpod
class CreateClassroom extends _$CreateClassroom {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<bool> createClassroom(Classroom classroom) async {
    final repo = ref.read(classroomRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() {
      return repo.createClassroom(classroom);
    });
    return !state.hasError;
  }
}

@riverpod
class DeleteClassroom extends _$DeleteClassroom {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<bool> deleteClassroom(String id) async {
    final repo = ref.read(classroomRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() {
      return repo.deleteClassroom(id);
    });
    return !state.hasError;
  }
}

@riverpod
class LeaveClassroom extends _$LeaveClassroom {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<bool> leaveClassroom(String classroomId) async {
    final user = ref.read(authRepositoryProvider).currentUser;
    if (user == null) {
      throw UserNotFoundException();
    }
    final repo = ref.read(classroomRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() {
      return repo.leaveClassroom(classroomId, user.uid);
    });
    return !state.hasError;
  }
}

@riverpod
class JoinClassroom extends _$JoinClassroom {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<bool> joinClassroom(String code) async {
    final user = ref.read(authRepositoryProvider).currentUser;
    if (user == null) {
      throw UserNotFoundException();
    }
    final repo = ref.read(classroomRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return repo.joinClassroom(user.uid, code);
    });
    return !state.hasError;
  }
}

@riverpod
class DeletePost extends _$DeletePost {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<bool> deletePost(String postId) async {
    final repo = ref.read(classroomRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return repo.deletePost(postId);
    });
    return !state.hasError;
  }
}

@Riverpod(keepAlive: true)
class CurrentClassroom extends _$CurrentClassroom {
  @override
  Classroom build() {
    return Classroom.empty();
  }

  void update(Classroom classroom) async {
    state = classroom;
  }
}
