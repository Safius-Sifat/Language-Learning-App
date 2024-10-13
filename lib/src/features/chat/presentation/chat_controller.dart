import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/domain/user_model.dart';
import '../data/chat_repository.dart';
import '../domain/message.dart';
part 'chat_controller.g.dart';

@riverpod
class UpdateReadStatus extends _$UpdateReadStatus {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<bool> updateStatus(Message message) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return ref.read(chatRepositoryProvider).updateMessageReadStatus(message);
    });
    return !state.hasError;
  }
}

@riverpod
class SendMessage extends _$SendMessage {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<bool> send(UserModel user, String msg) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return ref.read(chatRepositoryProvider).sendMessage(user, msg);
    });
    return !state.hasError;
  }
}

@riverpod
class SendGroupMessage extends _$SendGroupMessage {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<bool> send(String classroomId, String msg) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return ref
          .read(chatRepositoryProvider)
          .sendGroupMessage(classroomId, msg);
    });
    return !state.hasError;
  }
}
