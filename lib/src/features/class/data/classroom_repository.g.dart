// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classroom_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$classroomRepositoryHash() =>
    r'2332dc3aa44792db86a35c22e7e0ab27750f1349';

/// See also [classroomRepository].
@ProviderFor(classroomRepository)
final classroomRepositoryProvider =
    AutoDisposeProvider<ClassroomRepository>.internal(
  classroomRepository,
  name: r'classroomRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$classroomRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ClassroomRepositoryRef = AutoDisposeProviderRef<ClassroomRepository>;
String _$classroomsHash() => r'2b1f542a269cbd7233bd93c6611f62587c0e396f';

/// See also [classrooms].
@ProviderFor(classrooms)
final classroomsProvider = FutureProvider<List<Classroom>>.internal(
  classrooms,
  name: r'classroomsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$classroomsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ClassroomsRef = FutureProviderRef<List<Classroom>>;
String _$classroomsByIdHash() => r'dc63cba73c2654b7389fec19118b75b5e79369ea';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [classroomsById].
@ProviderFor(classroomsById)
const classroomsByIdProvider = ClassroomsByIdFamily();

/// See also [classroomsById].
class ClassroomsByIdFamily extends Family<AsyncValue<Classroom>> {
  /// See also [classroomsById].
  const ClassroomsByIdFamily();

  /// See also [classroomsById].
  ClassroomsByIdProvider call(
    String id,
  ) {
    return ClassroomsByIdProvider(
      id,
    );
  }

  @override
  ClassroomsByIdProvider getProviderOverride(
    covariant ClassroomsByIdProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'classroomsByIdProvider';
}

/// See also [classroomsById].
class ClassroomsByIdProvider extends FutureProvider<Classroom> {
  /// See also [classroomsById].
  ClassroomsByIdProvider(
    String id,
  ) : this._internal(
          (ref) => classroomsById(
            ref as ClassroomsByIdRef,
            id,
          ),
          from: classroomsByIdProvider,
          name: r'classroomsByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$classroomsByIdHash,
          dependencies: ClassroomsByIdFamily._dependencies,
          allTransitiveDependencies:
              ClassroomsByIdFamily._allTransitiveDependencies,
          id: id,
        );

  ClassroomsByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Classroom> Function(ClassroomsByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ClassroomsByIdProvider._internal(
        (ref) => create(ref as ClassroomsByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  FutureProviderElement<Classroom> createElement() {
    return _ClassroomsByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ClassroomsByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ClassroomsByIdRef on FutureProviderRef<Classroom> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ClassroomsByIdProviderElement extends FutureProviderElement<Classroom>
    with ClassroomsByIdRef {
  _ClassroomsByIdProviderElement(super.provider);

  @override
  String get id => (origin as ClassroomsByIdProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
