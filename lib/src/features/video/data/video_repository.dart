import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:language_learning_app/src/features/video/domain/video.dart';
import 'package:language_learning_app/src/utils/firebase_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:language_learning_app/src/constants/firebase_constants.dart';
part 'video_repository.g.dart';

class VideoUploadRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;
  const VideoUploadRepository(
      FirebaseFirestore firestore, FirebaseStorage storage)
      : _firestore = firestore,
        _storage = storage;
  Future<String> uploadFileToFirebase(File file) async {
    final storageRef = _storage.ref().child(
        'videos/${DateTime.now().toIso8601String()}${file.path.split('/').last}');
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

  Future<void> uploadVideo(
      {required String name,
      required String filePath,
      required String classroomId}) async {
    final audioUrl = await uploadFileToFirebase(File(filePath));
    final video = Video(
      name: name,
      classroomId: classroomId,
      videoUrl: audioUrl,
      type: 'video',
      createdAt: DateTime.now(),
    );
    await _firestore
        .collection(FirebaseConstants.postCollection)
        .add(video.toDocument());
  }
}

@riverpod
VideoUploadRepository videoUploadRepository(VideoUploadRepositoryRef ref) {
  final firestore = ref.read(firestoreProvider);
  final storage = ref.read(storageProvider);
  return VideoUploadRepository(
    firestore,
    storage,
  );
}
