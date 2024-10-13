// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      id: json['id'] as String?,
      toName: json['toName'] as String,
      toId: json['toId'] as String,
      msg: json['msg'] as String,
      read: json['read'] as String,
      fromId: json['fromId'] as String,
      fromName: json['fromName'] as String,
      sent: json['sent'] as String,
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'toName': instance.toName,
      'toId': instance.toId,
      'msg': instance.msg,
      'read': instance.read,
      'fromId': instance.fromId,
      'fromName': instance.fromName,
      'sent': instance.sent,
    };
