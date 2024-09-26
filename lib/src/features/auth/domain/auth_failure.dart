import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.unKnown() = _UnKnown;
  const factory AuthFailure.server([String? errorCode, String? message]) =
      _Server;
  const factory AuthFailure.noConnection() = _NoConnection;
}
