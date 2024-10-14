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
    @JsonKey(
        name: 'createdAt',
        fromJson: _fromJsonTimestamp,
        toJson: _toJsonTimestamp)
    required DateTime createdAt,
    @JsonKey(
        name: 'lastActive',
        fromJson: _fromJsonTimestamp,
        toJson: _toJsonTimestamp)
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

Timestamp _toJsonTimestamp(DateTime dateTime) =>
    Timestamp.fromDate(dateTime); // Add this method
DateTime _fromJsonTimestamp(Timestamp timestamp) =>
    timestamp.toDate(); // Add this method
