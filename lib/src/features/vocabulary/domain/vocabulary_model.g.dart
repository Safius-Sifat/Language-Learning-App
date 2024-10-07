// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VocabularyModelImpl _$$VocabularyModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VocabularyModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String,
      type: json['type'] as String,
      classroomId: json['classroomId'] as String,
      vocabularies: (json['vocabularies'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      participants: (json['participants'] as List<dynamic>)
          .map((e) => Participant.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      deadline: DateTime.parse(json['deadline'] as String),
    );

Map<String, dynamic> _$$VocabularyModelImplToJson(
        _$VocabularyModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'classroomId': instance.classroomId,
      'vocabularies': instance.vocabularies,
      'participants': instance.participants,
      'createdAt': instance.createdAt.toIso8601String(),
      'deadline': instance.deadline.toIso8601String(),
    };

_$ParticipantImpl _$$ParticipantImplFromJson(Map<String, dynamic> json) =>
    _$ParticipantImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String?,
      audioUrl: json['audioUrl'] as String?,
    );

Map<String, dynamic> _$$ParticipantImplToJson(_$ParticipantImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'audioUrl': instance.audioUrl,
    };
