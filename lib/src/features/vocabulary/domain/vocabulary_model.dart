import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'vocabulary_model.g.dart';
part 'vocabulary_model.freezed.dart';

@freezed
abstract class VocabularyModel implements _$VocabularyModel {
  const factory VocabularyModel({
    String? id,
    required String name,
    required String type,
    required String classroomId,
    required List<int> vocabularies,
    required List<Participant> participants,
    required DateTime createdAt,
    required DateTime deadline,
  }) = _VocabularyModel;
  const VocabularyModel._();

  factory VocabularyModel.fromJson(Map<String, Object?> json) =>
      _$VocabularyModelFromJson(json);
  // factory PronunciationModel.empty() => const PronunciationModel(
  //       email: '',
  //       name: '',
  //       photoUrl: '',
  //     );

  factory VocabularyModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return VocabularyModel.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}

@freezed
class Participant with _$Participant {
  const factory Participant({
    required String id,
    required String email,
    String? name,
    String? audioUrl,
  }) = _Participant;
  factory Participant.fromJson(Map<String, Object?> json) =>
      _$ParticipantFromJson(json);
}
