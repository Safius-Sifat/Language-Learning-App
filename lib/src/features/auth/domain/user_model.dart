import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel implements _$UserModel {
  const factory UserModel({
    String? id,
    required String email,
    String? name,
    String? photoUrl,
    required DateTime createdAt,
    required DateTime lastActive,
    required bool isOnline,
  }) = _UserModel;
  const UserModel._();

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
  factory UserModel.empty() => UserModel(
        email: '',
        name: '',
        photoUrl: '',
        createdAt: DateTime.now(),
        lastActive: DateTime.now(),
        isOnline: false,
      );

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return UserModel.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
