// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoImpl _$$VideoImplFromJson(Map<String, dynamic> json) => _$VideoImpl(
      id: json['id'] as String?,
      name: json['name'] as String,
      type: json['type'] as String,
      classroomId: json['classroomId'] as String,
      videoUrl: json['videoUrl'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$VideoImplToJson(_$VideoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'classroomId': instance.classroomId,
      'videoUrl': instance.videoUrl,
      'createdAt': instance.createdAt.toIso8601String(),
    };
