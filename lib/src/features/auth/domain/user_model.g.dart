// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String?,
      email: json['email'] as String,
      name: json['name'] as String?,
      photoUrl: json['photoUrl'] as String?,
      createdAt: _fromJsonTimestamp(json['createdAt'] as Timestamp),
      lastActive: _fromJsonTimestamp(json['lastActive'] as Timestamp),
      isOnline: json['isOnline'] as bool,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'createdAt': _toJsonTimestamp(instance.createdAt),
      'lastActive': _toJsonTimestamp(instance.lastActive),
      'isOnline': instance.isOnline,
    };
