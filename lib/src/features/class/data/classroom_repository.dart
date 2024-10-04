import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:language_learning_app/src/exception/app_exception.dart';
import 'package:language_learning_app/src/features/auth/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/firebase_constants.dart';
import '../../../utils/firebase_providers.dart';
import '../domain/classroom.dart';
part 'classroom_repository.g.dart';

class ClassroomRepository {
  final FirebaseFirestore _firestore;

  ClassroomRepository(FirebaseFirestore firestore) : _firestore = firestore;

  CollectionReference get _classroom =>
      _firestore.collection(FirebaseConstants.classroomsCollection);

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
  //   final teacherRooms = teacher.map((snapshot) =>
  //       snapshot.docs.map((doc) => Classroom.fromDocument(doc)).toList());
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

  Future<void> joinClassroom(String id, String code) async {
    final result = await _classroom.where('code', isEqualTo: code).get();
    final classroom = Classroom.fromDocument(result.docs.first);
    if (classroom.students.contains(id)) {
      throw AlreadyMemberException();
    } else if (classroom.teacherId == id) {
      throw CreatorClassroomException();
    }
    if (classroom.code == code) {
      await _classroom.doc(classroom.id).update({
        'students': FieldValue.arrayUnion([id])
      });
    }
  }

  // Future<Classroom> updateClassroom(Classroom classroom) async {
  //   // Update classroom in API
  // }
  Future<void> deleteClassroom(String id) async {
    await _classroom.doc(id).delete();
  }
}

@riverpod
ClassroomRepository classroomRepository(ClassroomRepositoryRef ref) {
  final firestore = ref.read(firestoreProvider);
  return ClassroomRepository(firestore);
}

@Riverpod(keepAlive: true)
Future<List<Classroom>> classrooms(ClassroomsRef ref) {
  final user = ref.read(authRepositoryProvider).currentUser;
  if (user == null) {
    throw UserNotFoundException();
  }
  return ref.read(classroomRepositoryProvider).fetchClassrooms(user.uid);
}

// @Riverpod(keepAlive: true)
// Stream<List<Classroom>> watchClassrooms(WatchClassroomsRef ref) {
//   return ref.read(classroomRepositoryProvider).watchClassrooms();
// }

@Riverpod(keepAlive: true)
Future<Classroom> classroomsById(ClassroomsByIdRef ref, String id) {
  return ref.read(classroomRepositoryProvider).fetchClassroomById(id);
}
