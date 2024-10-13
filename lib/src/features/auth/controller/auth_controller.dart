import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/auth_repository.dart';

part 'auth_controller.g.dart';

@riverpod
class SignInWithGoogle extends _$SignInWithGoogle {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<bool> signInUsingGoogle() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => ref.read(authRepositoryProvider).signInUsingGoogle());
    return state.hasValue;
  }
}

@riverpod
class ResetPassword extends _$ResetPassword {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<bool> resetPassword() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => ref.read(authRepositoryProvider).sendPasswordResetEmail());
    return state.hasValue;
  }
}

@riverpod
class EmailPasswordSignIn extends _$EmailPasswordSignIn {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<bool> signInUsingEmailPassword(
      {required String email, required String password}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref
        .read(authRepositoryProvider)
        .loginWithEmail(email: email, password: password));
    return state.hasValue;
  }
}

@riverpod
class EmailPasswordSignUp extends _$EmailPasswordSignUp {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<bool> registerUsingEmailPassword(
      {required String email, required String password}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref
        .read(authRepositoryProvider)
        .registerWithEmail(email: email, password: password));
    return state.hasValue;
  }
}

@riverpod
class UpdateActiveStatus extends _$UpdateActiveStatus {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<bool> updateStatus(bool isOnline) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => ref.read(authRepositoryProvider).updateActiveStatus(isOnline));
    return state.hasValue;
  }
}
