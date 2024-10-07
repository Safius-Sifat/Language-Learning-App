import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'video.g.dart';
part 'video.freezed.dart';

@freezed
abstract class Video implements _$Video {
  const factory Video({
    String? id,
    required String name,
    required String type,
    required String classroomId,
    required String videoUrl,
    required DateTime createdAt,
  }) = _Video;
  const Video._();

  factory Video.fromJson(Map<String, Object?> json) => _$VideoFromJson(json);
  // factory PronunciationModel.empty() => const PronunciationModel(
  //       email: '',
  //       name: '',
  //       photoUrl: '',
  //     );

  factory Video.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return Video.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
