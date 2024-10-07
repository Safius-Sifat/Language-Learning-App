// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pronunciation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PronunciationModelImpl _$$PronunciationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PronunciationModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String,
      type: json['type'] as String,
      classroomId: json['classroomId'] as String,
      audioUrl: json['audioUrl'] as String,
      textIndex: (json['textIndex'] as num).toInt(),
      participants: (json['participants'] as List<dynamic>)
          .map((e) => Participant.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      deadline: DateTime.parse(json['deadline'] as String),
    );

Map<String, dynamic> _$$PronunciationModelImplToJson(
        _$PronunciationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'classroomId': instance.classroomId,
      'audioUrl': instance.audioUrl,
      'textIndex': instance.textIndex,
      'participants': instance.participants,
      'createdAt': instance.createdAt.toIso8601String(),
      'deadline': instance.deadline.toIso8601String(),
    };
