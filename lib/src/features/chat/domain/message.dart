import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
abstract class Message implements _$Message {
  const factory Message({
    String? id,
    required String toId,
    required String msg,
    required String read,
    required String fromId,
    required String sent,
  }) = _Message;
  const Message._();

  factory Message.fromJson(Map<String, Object?> json) =>
      _$MessageFromJson(json);
  factory Message.empty() => const Message(
        toId: '',
        msg: '',
        read: '',
        fromId: '',
        sent: '',
      );

  factory Message.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return Message.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
