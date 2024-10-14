import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:language_learning_app/src/features/vocabulary/domain/vocabulary_model.dart';
import 'package:language_learning_app/src/utils/firebase_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/firebase_constants.dart';
part 'vocabulary_repository.g.dart';

class VocabularyRepository {
  final FirebaseFirestore _firestore;
  const VocabularyRepository(FirebaseFirestore firestore)
      : _firestore = firestore;
  Future<void> createVocabularyAssignment(
      {required String name,
      required String deadline,
      required List<int> vocabularies,
      required String classroomId}) async {
    final vocabularyModel = VocabularyModel(
        name: name,
        classroomId: classroomId,
        type: 'vocabulary',
        vocabularies: vocabularies,
        participants: [],
        createdAt: DateTime.now(),
        deadline: DateTime.parse(deadline));
    await _firestore
        .collection(FirebaseConstants.postCollection)
        .add(vocabularyModel.toDocument());
  }

  Future<void> markComplete(
      {required String postId, required Participant participant}) async {
    return _firestore
        .collection(FirebaseConstants.postCollection)
        .doc(postId)
        .update({
      'participants': FieldValue.arrayUnion([participant.toJson()])
    });
  }

  Future<void> editPost(
      {required String postId,
      required String name,
      required String deadline}) async {
    return _firestore
        .collection(FirebaseConstants.postCollection)
        .doc(postId)
        .update({'name': name, 'deadline': deadline});
  }
}

@riverpod
VocabularyRepository vocabularyRepository(VocabularyRepositoryRef ref) {
  final firestore = ref.read(firestoreProvider);
  return VocabularyRepository(
    firestore,
  );
}
