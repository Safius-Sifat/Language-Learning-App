// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pronunciation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PronunciationModel _$PronunciationModelFromJson(Map<String, dynamic> json) {
  return _PronunciationModel.fromJson(json);
}

/// @nodoc
mixin _$PronunciationModel {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get classroomId => throw _privateConstructorUsedError;
  String get audioUrl => throw _privateConstructorUsedError;
  int get textIndex => throw _privateConstructorUsedError;
  List<Participant> get participants => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get deadline => throw _privateConstructorUsedError;

  /// Serializes this PronunciationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PronunciationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PronunciationModelCopyWith<PronunciationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PronunciationModelCopyWith<$Res> {
  factory $PronunciationModelCopyWith(
          PronunciationModel value, $Res Function(PronunciationModel) then) =
      _$PronunciationModelCopyWithImpl<$Res, PronunciationModel>;
  @useResult
  $Res call(
      {String? id,
      String name,
      String type,
      String classroomId,
      String audioUrl,
      int textIndex,
      List<Participant> participants,
      DateTime createdAt,
      DateTime deadline});
}

/// @nodoc
class _$PronunciationModelCopyWithImpl<$Res, $Val extends PronunciationModel>
    implements $PronunciationModelCopyWith<$Res> {
  _$PronunciationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PronunciationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? type = null,
    Object? classroomId = null,
    Object? audioUrl = null,
    Object? textIndex = null,
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
      audioUrl: null == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String,
      textIndex: null == textIndex
          ? _value.textIndex
          : textIndex // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$PronunciationModelImplCopyWith<$Res>
    implements $PronunciationModelCopyWith<$Res> {
  factory _$$PronunciationModelImplCopyWith(_$PronunciationModelImpl value,
          $Res Function(_$PronunciationModelImpl) then) =
      __$$PronunciationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String name,
      String type,
      String classroomId,
      String audioUrl,
      int textIndex,
      List<Participant> participants,
      DateTime createdAt,
      DateTime deadline});
}

/// @nodoc
class __$$PronunciationModelImplCopyWithImpl<$Res>
    extends _$PronunciationModelCopyWithImpl<$Res, _$PronunciationModelImpl>
    implements _$$PronunciationModelImplCopyWith<$Res> {
  __$$PronunciationModelImplCopyWithImpl(_$PronunciationModelImpl _value,
      $Res Function(_$PronunciationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PronunciationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? type = null,
    Object? classroomId = null,
    Object? audioUrl = null,
    Object? textIndex = null,
    Object? participants = null,
    Object? createdAt = null,
    Object? deadline = null,
  }) {
    return _then(_$PronunciationModelImpl(
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
      audioUrl: null == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String,
      textIndex: null == textIndex
          ? _value.textIndex
          : textIndex // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$PronunciationModelImpl extends _PronunciationModel {
  const _$PronunciationModelImpl(
      {this.id,
      required this.name,
      required this.type,
      required this.classroomId,
      required this.audioUrl,
      required this.textIndex,
      required final List<Participant> participants,
      required this.createdAt,
      required this.deadline})
      : _participants = participants,
        super._();

  factory _$PronunciationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PronunciationModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final String type;
  @override
  final String classroomId;
  @override
  final String audioUrl;
  @override
  final int textIndex;
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
    return 'PronunciationModel(id: $id, name: $name, type: $type, classroomId: $classroomId, audioUrl: $audioUrl, textIndex: $textIndex, participants: $participants, createdAt: $createdAt, deadline: $deadline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PronunciationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.classroomId, classroomId) ||
                other.classroomId == classroomId) &&
            (identical(other.audioUrl, audioUrl) ||
                other.audioUrl == audioUrl) &&
            (identical(other.textIndex, textIndex) ||
                other.textIndex == textIndex) &&
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
      audioUrl,
      textIndex,
      const DeepCollectionEquality().hash(_participants),
      createdAt,
      deadline);

  /// Create a copy of PronunciationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PronunciationModelImplCopyWith<_$PronunciationModelImpl> get copyWith =>
      __$$PronunciationModelImplCopyWithImpl<_$PronunciationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PronunciationModelImplToJson(
      this,
    );
  }
}

abstract class _PronunciationModel extends PronunciationModel {
  const factory _PronunciationModel(
      {final String? id,
      required final String name,
      required final String type,
      required final String classroomId,
      required final String audioUrl,
      required final int textIndex,
      required final List<Participant> participants,
      required final DateTime createdAt,
      required final DateTime deadline}) = _$PronunciationModelImpl;
  const _PronunciationModel._() : super._();

  factory _PronunciationModel.fromJson(Map<String, dynamic> json) =
      _$PronunciationModelImpl.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  String get type;
  @override
  String get classroomId;
  @override
  String get audioUrl;
  @override
  int get textIndex;
  @override
  List<Participant> get participants;
  @override
  DateTime get createdAt;
  @override
  DateTime get deadline;

  /// Create a copy of PronunciationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PronunciationModelImplCopyWith<_$PronunciationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
