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
String _$classroomsHash() => r'f654b9e7eefbdcb35d0d74a8f576cde43128f86f';

/// See also [classrooms].
@ProviderFor(classrooms)
final classroomsProvider = AutoDisposeFutureProvider<List<Classroom>>.internal(
  classrooms,
  name: r'classroomsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$classroomsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ClassroomsRef = AutoDisposeFutureProviderRef<List<Classroom>>;
String _$classroomPostsHash() => r'7dc2c8211b59ad9c37acd14a95b0331c03f4cb95';

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

/// See also [classroomPosts].
@ProviderFor(classroomPosts)
const classroomPostsProvider = ClassroomPostsFamily();

/// See also [classroomPosts].
class ClassroomPostsFamily extends Family<AsyncValue<List<Object>>> {
  /// See also [classroomPosts].
  const ClassroomPostsFamily();

  /// See also [classroomPosts].
  ClassroomPostsProvider call(
    String classroomId,
  ) {
    return ClassroomPostsProvider(
      classroomId,
    );
  }

  @override
  ClassroomPostsProvider getProviderOverride(
    covariant ClassroomPostsProvider provider,
  ) {
    return call(
      provider.classroomId,
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
  String? get name => r'classroomPostsProvider';
}

/// See also [classroomPosts].
class ClassroomPostsProvider extends AutoDisposeStreamProvider<List<Object>> {
  /// See also [classroomPosts].
  ClassroomPostsProvider(
    String classroomId,
  ) : this._internal(
          (ref) => classroomPosts(
            ref as ClassroomPostsRef,
            classroomId,
          ),
          from: classroomPostsProvider,
          name: r'classroomPostsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$classroomPostsHash,
          dependencies: ClassroomPostsFamily._dependencies,
          allTransitiveDependencies:
              ClassroomPostsFamily._allTransitiveDependencies,
          classroomId: classroomId,
        );

  ClassroomPostsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.classroomId,
  }) : super.internal();

  final String classroomId;

  @override
  Override overrideWith(
    Stream<List<Object>> Function(ClassroomPostsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ClassroomPostsProvider._internal(
        (ref) => create(ref as ClassroomPostsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        classroomId: classroomId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Object>> createElement() {
    return _ClassroomPostsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ClassroomPostsProvider && other.classroomId == classroomId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, classroomId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ClassroomPostsRef on AutoDisposeStreamProviderRef<List<Object>> {
  /// The parameter `classroomId` of this provider.
  String get classroomId;
}

class _ClassroomPostsProviderElement
    extends AutoDisposeStreamProviderElement<List<Object>>
    with ClassroomPostsRef {
  _ClassroomPostsProviderElement(super.provider);

  @override
  String get classroomId => (origin as ClassroomPostsProvider).classroomId;
}

String _$classroomsByIdHash() => r'dc63cba73c2654b7389fec19118b75b5e79369ea';

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
