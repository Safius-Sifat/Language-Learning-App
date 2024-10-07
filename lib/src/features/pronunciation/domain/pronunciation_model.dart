import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../vocabulary/domain/vocabulary_model.dart';
part 'pronunciation_model.freezed.dart';
part 'pronunciation_model.g.dart';

@freezed
abstract class PronunciationModel implements _$PronunciationModel {
  const factory PronunciationModel({
    String? id,
    required String name,
    required String type,
    required String classroomId,
    required String audioUrl,
    required int textIndex,
    required List<Participant> participants,
    required DateTime createdAt,
    required DateTime deadline,
  }) = _PronunciationModel;
  const PronunciationModel._();

  factory PronunciationModel.fromJson(Map<String, Object?> json) =>
      _$PronunciationModelFromJson(json);
  // factory PronunciationModel.empty() => const PronunciationModel(
  //       email: '',
  //       name: '',
  //       photoUrl: '',
  //     );

  factory PronunciationModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return PronunciationModel.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
