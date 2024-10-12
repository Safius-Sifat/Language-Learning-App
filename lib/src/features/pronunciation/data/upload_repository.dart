import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:language_learning_app/src/features/pronunciation/domain/pronunciation_model.dart';
import 'package:language_learning_app/src/features/vocabulary/domain/vocabulary_model.dart';
import 'package:language_learning_app/src/utils/firebase_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:language_learning_app/src/constants/firebase_constants.dart';
part 'upload_repository.g.dart';

class UploadRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;
  const UploadRepository(FirebaseFirestore firestore, FirebaseStorage storage)
      : _firestore = firestore,
        _storage = storage;
  Future<String> uploadFileToFirebase(File file) async {
    final storageRef = _storage.ref(
        'pronunciations/${DateTime.now().toIso8601String()}${file.path.split('/').last}');
    final uploadTask = storageRef.putFile(file);
    uploadTask.snapshotEvents.listen((event) {
      print('Task state: ${event.state}');
      print('Progress: ${(event.bytesTransferred / event.totalBytes) * 100} %');
    });

    // Wait for upload completion
    TaskSnapshot taskSnapshot = await uploadTask;
    // Get download URL
    final downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<void> createPronunciationAssignment(
      {required String name,
      required String deadline,
      required String filePath,
      required int textIndex,
      required String classroomId}) async {
    final audioUrl = await uploadFileToFirebase(File(filePath));
    final pronunciationModel = PronunciationModel(
        name: name,
        classroomId: classroomId,
        audioUrl: audioUrl,
        type: 'pronunciation',
        textIndex: textIndex,
        participants: [],
        createdAt: DateTime.now(),
        deadline: DateTime.parse(deadline));
    await _firestore
        .collection(FirebaseConstants.postCollection)
        .add(pronunciationModel.toDocument());
  }

  Future<void> markPronunciationComplete(
      {required User user,
      required String postId,
      required String filePath}) async {
    final audioUrl = await uploadFileToFirebase(File(filePath));
    final participant = Participant(
      id: user.uid,
      email: user.email!,
      name: user.displayName,
      audioUrl: audioUrl,
    );
    return _firestore
        .collection(FirebaseConstants.postCollection)
        .doc(postId)
        .update({
      'participants': FieldValue.arrayUnion([participant.toJson()])
    });
  }
}

@riverpod
UploadRepository uploadRepository(UploadRepositoryRef ref) {
  final firestore = ref.read(firestoreProvider);
  final storage = ref.read(storageProvider);
  return UploadRepository(
    firestore,
    storage,
  );
}
