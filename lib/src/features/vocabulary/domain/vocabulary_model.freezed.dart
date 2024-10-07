// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vocabulary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VocabularyModel _$VocabularyModelFromJson(Map<String, dynamic> json) {
  return _VocabularyModel.fromJson(json);
}

/// @nodoc
mixin _$VocabularyModel {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get classroomId => throw _privateConstructorUsedError;
  List<int> get vocabularies => throw _privateConstructorUsedError;
  List<Participant> get participants => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get deadline => throw _privateConstructorUsedError;

  /// Serializes this VocabularyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VocabularyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VocabularyModelCopyWith<VocabularyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VocabularyModelCopyWith<$Res> {
  factory $VocabularyModelCopyWith(
          VocabularyModel value, $Res Function(VocabularyModel) then) =
      _$VocabularyModelCopyWithImpl<$Res, VocabularyModel>;
  @useResult
  $Res call(
      {String? id,
      String name,
      String type,
      String classroomId,
      List<int> vocabularies,
      List<Participant> participants,
      DateTime createdAt,
      DateTime deadline});
}

/// @nodoc
class _$VocabularyModelCopyWithImpl<$Res, $Val extends VocabularyModel>
    implements $VocabularyModelCopyWith<$Res> {
  _$VocabularyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VocabularyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? type = null,
    Object? classroomId = null,
    Object? vocabularies = null,
    Object? participants = null,
    Object? createdAt = null,
    Object? deadline = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      classroomId: null == classroomId
          ? _value.classroomId
          : classroomId // ignore: cast_nullable_to_non_nullable
              as String,
      vocabularies: null == vocabularies
          ? _value.vocabularies
          : vocabularies // ignore: cast_nullable_to_non_nullable
              as List<int>,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<Participant>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VocabularyModelImplCopyWith<$Res>
    implements $VocabularyModelCopyWith<$Res> {
  factory _$$VocabularyModelImplCopyWith(_$VocabularyModelImpl value,
          $Res Function(_$VocabularyModelImpl) then) =
      __$$VocabularyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String name,
      String type,
      String classroomId,
      List<int> vocabularies,
      List<Participant> participants,
      DateTime createdAt,
      DateTime deadline});
}

/// @nodoc
class __$$VocabularyModelImplCopyWithImpl<$Res>
    extends _$VocabularyModelCopyWithImpl<$Res, _$VocabularyModelImpl>
    implements _$$VocabularyModelImplCopyWith<$Res> {
  __$$VocabularyModelImplCopyWithImpl(
      _$VocabularyModelImpl _value, $Res Function(_$VocabularyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VocabularyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? type = null,
    Object? classroomId = null,
    Object? vocabularies = null,
    Object? participants = null,
    Object? createdAt = null,
    Object? deadline = null,
  }) {
    return _then(_$VocabularyModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      classroomId: null == classroomId
          ? _value.classroomId
          : classroomId // ignore: cast_nullable_to_non_nullable
              as String,
      vocabularies: null == vocabularies
          ? _value._vocabularies
          : vocabularies // ignore: cast_nullable_to_non_nullable
              as List<int>,
      participants: null == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<Participant>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VocabularyModelImpl extends _VocabularyModel {
  const _$VocabularyModelImpl(
      {this.id,
      required this.name,
      required this.type,
      required this.classroomId,
      required final List<int> vocabularies,
      required final List<Participant> participants,
      required this.createdAt,
      required this.deadline})
      : _vocabularies = vocabularies,
        _participants = participants,
        super._();

  factory _$VocabularyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VocabularyModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final String type;
  @override
  final String classroomId;
  final List<int> _vocabularies;
  @override
  List<int> get vocabularies {
    if (_vocabularies is EqualUnmodifiableListView) return _vocabularies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vocabularies);
  }

  final List<Participant> _participants;
  @override
  List<Participant> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime deadline;

  @override
  String toString() {
    return 'VocabularyModel(id: $id, name: $name, type: $type, classroomId: $classroomId, vocabularies: $vocabularies, participants: $participants, createdAt: $createdAt, deadline: $deadline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VocabularyModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.classroomId, classroomId) ||
                other.classroomId == classroomId) &&
            const DeepCollectionEquality()
                .equals(other._vocabularies, _vocabularies) &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      type,
      classroomId,
      const DeepCollectionEquality().hash(_vocabularies),
      const DeepCollectionEquality().hash(_participants),
      createdAt,
      deadline);

  /// Create a copy of VocabularyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VocabularyModelImplCopyWith<_$VocabularyModelImpl> get copyWith =>
      __$$VocabularyModelImplCopyWithImpl<_$VocabularyModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VocabularyModelImplToJson(
      this,
    );
  }
}

abstract class _VocabularyModel extends VocabularyModel {
  const factory _VocabularyModel(
      {final String? id,
      required final String name,
      required final String type,
      required final String classroomId,
      required final List<int> vocabularies,
      required final List<Participant> participants,
      required final DateTime createdAt,
      required final DateTime deadline}) = _$VocabularyModelImpl;
  const _VocabularyModel._() : super._();

  factory _VocabularyModel.fromJson(Map<String, dynamic> json) =
      _$VocabularyModelImpl.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  String get type;
  @override
  String get classroomId;
  @override
  List<int> get vocabularies;
  @override
  List<Participant> get participants;
  @override
  DateTime get createdAt;
  @override
  DateTime get deadline;

  /// Create a copy of VocabularyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VocabularyModelImplCopyWith<_$VocabularyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Participant _$ParticipantFromJson(Map<String, dynamic> json) {
  return _Participant.fromJson(json);
}

/// @nodoc
mixin _$Participant {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get audioUrl => throw _privateConstructorUsedError;

  /// Serializes this Participant to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Participant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ParticipantCopyWith<Participant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParticipantCopyWith<$Res> {
  factory $ParticipantCopyWith(
          Participant value, $Res Function(Participant) then) =
      _$ParticipantCopyWithImpl<$Res, Participant>;
  @useResult
  $Res call({String id, String email, String? name, String? audioUrl});
}

/// @nodoc
class _$ParticipantCopyWithImpl<$Res, $Val extends Participant>
    implements $ParticipantCopyWith<$Res> {
  _$ParticipantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Participant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = freezed,
    Object? audioUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      audioUrl: freezed == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParticipantImplCopyWith<$Res>
    implements $ParticipantCopyWith<$Res> {
  factory _$$ParticipantImplCopyWith(
          _$ParticipantImpl value, $Res Function(_$ParticipantImpl) then) =
      __$$ParticipantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String email, String? name, String? audioUrl});
}

/// @nodoc
class __$$ParticipantImplCopyWithImpl<$Res>
    extends _$ParticipantCopyWithImpl<$Res, _$ParticipantImpl>
    implements _$$ParticipantImplCopyWith<$Res> {
  __$$ParticipantImplCopyWithImpl(
      _$ParticipantImpl _value, $Res Function(_$ParticipantImpl) _then)
      : super(_value, _then);

  /// Create a copy of Participant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = freezed,
    Object? audioUrl = freezed,
  }) {
    return _then(_$ParticipantImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      audioUrl: freezed == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParticipantImpl implements _Participant {
  const _$ParticipantImpl(
      {required this.id, required this.email, this.name, this.audioUrl});

  factory _$ParticipantImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParticipantImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String? name;
  @override
  final String? audioUrl;

  @override
  String toString() {
    return 'Participant(id: $id, email: $email, name: $name, audioUrl: $audioUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParticipantImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.audioUrl, audioUrl) ||
                other.audioUrl == audioUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, name, audioUrl);

  /// Create a copy of Participant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParticipantImplCopyWith<_$ParticipantImpl> get copyWith =>
      __$$ParticipantImplCopyWithImpl<_$ParticipantImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParticipantImplToJson(
      this,
    );
  }
}

abstract class _Participant implements Participant {
  const factory _Participant(
      {required final String id,
      required final String email,
      final String? name,
      final String? audioUrl}) = _$ParticipantImpl;

  factory _Participant.fromJson(Map<String, dynamic> json) =
      _$ParticipantImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String? get name;
  @override
  String? get audioUrl;

  /// Create a copy of Participant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParticipantImplCopyWith<_$ParticipantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
