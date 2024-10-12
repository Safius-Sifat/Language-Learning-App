import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:language_learning_app/src/exception/app_exception.dart';
import 'package:language_learning_app/src/features/auth/repository/auth_repository.dart';
import 'package:language_learning_app/src/features/pronunciation/domain/pronunciation_model.dart';
import 'package:language_learning_app/src/features/vocabulary/domain/vocabulary_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/firebase_constants.dart';
import '../../../utils/firebase_providers.dart';
import '../../video/domain/video.dart';
import '../domain/classroom.dart';
part 'classroom_repository.g.dart';

class ClassroomRepository {
  final FirebaseFirestore _firestore;

  ClassroomRepository(FirebaseFirestore firestore) : _firestore = firestore;

  CollectionReference get _classroom =>
      _firestore.collection(FirebaseConstants.classroomsCollection);

  CollectionReference get _post =>
      _firestore.collection(FirebaseConstants.postCollection);

  Future<List<Classroom>> fetchClassrooms(String id) async {
    final teacher = await _classroom.where('teacherId', isEqualTo: id).get();
    final student = await _classroom.where('students', arrayContains: id).get();

    final teacherRooms =
        teacher.docs.map((doc) => Classroom.fromDocument(doc)).toList();
    final studentRooms =
        student.docs.map((doc) => Classroom.fromDocument(doc)).toList();
    return [...teacherRooms, ...studentRooms];
  }

  // Stream<List<Classroom>> watchClassrooms(String id) {
  //   final teacher = _classroom.where('teacherId', isEqualTo: id).snapshots();
  //   final student = _classroom.where('students', arrayContains: id).snapshots();
  //
  //   // return response.map((doc) => Classroom.fromDocument(doc)).toList();
  //
  // final teacherRooms = teacher.map((snapshot) =>
  //     snapshot.docs.map((doc) => Classroom.fromDocument(doc)).toList());
  //   final studentRooms = student.map((snapshot) =>
  //       snapshot.docs.map((doc) => Classroom.fromDocument(doc)).toList());
  //   StreamController<List<Classroom>> mergeController =
  //       StreamController<List<Classroom>>();
  // }

  Future<Classroom> fetchClassroomById(String id) async {
    return Classroom.fromDocument(await _classroom.doc(id).get());
  }

  Future<String> createClassroom(Classroom classroom) async {
    final response = await _classroom.add(classroom.toJson());
    return response.id;
  }

  Future<void> deletePost(String postId) async {
    await _post.doc(postId).delete();
    return;
  }

  Stream<List<Object>> fetchAssignments(String classroomId) {
    final postsResponse = _firestore
        .collection(FirebaseConstants.postCollection)
        .where('classroomId', isEqualTo: classroomId)
        .orderBy('createdAt', descending: true)
        .snapshots();

    final posts = postsResponse.map((snapshot) => snapshot.docs.map((doc) {
          final data = doc.data();
          if (data['type'] == 'pronunciation') {
            return PronunciationModel.fromDocument(doc);
          } else if (data['type'] == 'video') {
            return Video.fromDocument(doc);
          } else {
            return VocabularyModel.fromDocument(doc);
          }
        }).toList());

    return posts;
  }

  Future<void> joinClassroom(String id, String code) async {
    final result = await _classroom.where('code', isEqualTo: code).get();

    if (result.docs.isEmpty) {
      throw ClassroomNotFoundException();
    }
    final classroom = Classroom.fromDocument(result.docs.first);
    if (classroom.students.contains(id)) {
      throw AlreadyMemberException();
    }
    if (classroom.teacherId == id) {
      throw CreatorClassroomException();
    }
    if (classroom.code == code) {
      await _classroom.doc(classroom.id).update({
        'students': FieldValue.arrayUnion([id])
      });
    }
  }

  Future<void> leaveClassroom(String classroomId, String userId) async {
    await _classroom.doc(classroomId).update({
      'students': FieldValue.arrayRemove([userId])
    });
  }

  Future<void> deleteClassroom(String id) async {
    await _classroom.doc(id).delete();
  }
}

@riverpod
ClassroomRepository classroomRepository(ClassroomRepositoryRef ref) {
  final firestore = ref.read(firestoreProvider);
  return ClassroomRepository(firestore);
}

@riverpod
Future<List<Classroom>> classrooms(ClassroomsRef ref) {
  final user = ref.read(authRepositoryProvider).currentUser;
  if (user == null) {
    throw UserNotFoundException();
  }
  return ref.read(classroomRepositoryProvider).fetchClassrooms(user.uid);
}

@riverpod
Stream<List<Object>> classroomPosts(ClassroomPostsRef ref, String classroomId) {
  final user = ref.read(authRepositoryProvider).currentUser;
  if (user == null) {
    throw UserNotFoundException();
  }
  return ref.read(classroomRepositoryProvider).fetchAssignments(classroomId);
}
// @Riverpod(keepAlive: true)
// Stream<List<Classroom>> watchClassrooms(WatchClassroomsRef ref) {
//   return ref.read(classroomRepositoryProvider).watchClassrooms();
// }

@Riverpod(keepAlive: true)
Future<Classroom> classroomsById(ClassroomsByIdRef ref, String id) {
  return ref.read(classroomRepositoryProvider).fetchClassroomById(id);
}
