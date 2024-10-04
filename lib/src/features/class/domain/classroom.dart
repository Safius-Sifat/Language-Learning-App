import 'package:cloud_firestore/cloud_firestore.dart';

class Classroom {
  final String? id;
  final String name;
  final String description;
  final DateTime createdAt;
  final String teacherId;
  final String code;
  final String teacherName;
  final List<String> students;
  final String photoUrl;

  Classroom({
    this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.teacherId,
    required this.code,
    required this.teacherName,
    required this.students,
    required this.photoUrl,
  });
  Classroom copyWith({
    String? id,
    String? name,
    String? description,
    DateTime? createdAt,
    String? teacherId,
    String? code,
    String? techerName,
    List<String>? students,
    String? photoUrl,
  }) {
    return Classroom(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      teacherId: teacherId ?? this.teacherId,
      code: code ?? this.code,
      teacherName: techerName ?? teacherName,
      students: students ?? this.students,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  Classroom.empty()
      : id = 'laksjdfl',
        name = 'l;asdflkas',
        description = 'lkasjdflkajs',
        createdAt = DateTime.now(),
        teacherId = 'lkasdjflkasj',
        code = 'laksdj',
        teacherName = 'laksdjflkaj',
        students = [],
        photoUrl = 'https://picsum.photos/200';

  factory Classroom.fromJson(Map<String, dynamic> json) {
    return Classroom(
      id: json['id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      teacherId: json['teacherId'] as String,
      code: json['code'] as String,
      teacherName: json['techerName'] as String,
      students: List<String>.from(json['students'] as List),
      photoUrl: json['photoUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
      'teacherId': teacherId,
      'code': code,
      'techerName': teacherName,
      'students': students,
      'photoUrl': photoUrl,
    };
  }

  factory Classroom.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return Classroom.fromJson(data).copyWith(id: doc.id);
  }
}
