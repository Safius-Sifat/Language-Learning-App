// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      id: json['id'] as String?,
      toId: json['toId'] as String,
      msg: json['msg'] as String,
      read: json['read'] as String,
      fromId: json['fromId'] as String,
      sent: json['sent'] as String,
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'toId': instance.toId,
      'msg': instance.msg,
      'read': instance.read,
      'fromId': instance.fromId,
      'sent': instance.sent,
    };
