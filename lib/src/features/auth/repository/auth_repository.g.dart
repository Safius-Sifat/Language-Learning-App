// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authRepositoryHash() => r'dec59463aba7441d978e51678dc3a9ae3058bf22';

/// See also [authRepository].
@ProviderFor(authRepository)
final authRepositoryProvider = Provider<AuthRepository>.internal(
  authRepository,
  name: r'authRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthRepositoryRef = ProviderRef<AuthRepository>;
String _$authStateChangeHash() => r'086ff65ac4e9f363c5ad73b342ab99474072176f';

/// See also [authStateChange].
@ProviderFor(authStateChange)
final authStateChangeProvider = StreamProvider<User?>.internal(
  authStateChange,
  name: r'authStateChangeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authStateChangeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthStateChangeRef = StreamProviderRef<User?>;
String _$fetchUserByIdHash() => r'a7d798d545d5bf9e287ae1c9d894a3a15a387aa6';

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

/// See also [fetchUserById].
@ProviderFor(fetchUserById)
const fetchUserByIdProvider = FetchUserByIdFamily();

/// See also [fetchUserById].
class FetchUserByIdFamily extends Family<AsyncValue<UserModel>> {
  /// See also [fetchUserById].
  const FetchUserByIdFamily();

  /// See also [fetchUserById].
  FetchUserByIdProvider call({
    required String id,
  }) {
    return FetchUserByIdProvider(
      id: id,
    );
  }

  @override
  FetchUserByIdProvider getProviderOverride(
    covariant FetchUserByIdProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'fetchUserByIdProvider';
}

/// See also [fetchUserById].
class FetchUserByIdProvider extends AutoDisposeFutureProvider<UserModel> {
  /// See also [fetchUserById].
  FetchUserByIdProvider({
    required String id,
  }) : this._internal(
          (ref) => fetchUserById(
            ref as FetchUserByIdRef,
            id: id,
          ),
          from: fetchUserByIdProvider,
          name: r'fetchUserByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchUserByIdHash,
          dependencies: FetchUserByIdFamily._dependencies,
          allTransitiveDependencies:
              FetchUserByIdFamily._allTransitiveDependencies,
          id: id,
        );

  FetchUserByIdProvider._internal(
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
    FutureOr<UserModel> Function(FetchUserByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchUserByIdProvider._internal(
        (ref) => create(ref as FetchUserByIdRef),
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
  AutoDisposeFutureProviderElement<UserModel> createElement() {
    return _FetchUserByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchUserByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchUserByIdRef on AutoDisposeFutureProviderRef<UserModel> {
  /// The parameter `id` of this provider.
  String get id;
}

class _FetchUserByIdProviderElement
    extends AutoDisposeFutureProviderElement<UserModel> with FetchUserByIdRef {
  _FetchUserByIdProviderElement(super.provider);

  @override
  String get id => (origin as FetchUserByIdProvider).id;
}

String _$fetchUsersHash() => r'73e779258d912bb3117631ab8e27e8844a57939e';

/// See also [fetchUsers].
@ProviderFor(fetchUsers)
const fetchUsersProvider = FetchUsersFamily();

/// See also [fetchUsers].
class FetchUsersFamily extends Family<AsyncValue<List<UserModel>>> {
  /// See also [fetchUsers].
  const FetchUsersFamily();

  /// See also [fetchUsers].
  FetchUsersProvider call({
    required List<String> ids,
  }) {
    return FetchUsersProvider(
      ids: ids,
    );
  }

  @override
  FetchUsersProvider getProviderOverride(
    covariant FetchUsersProvider provider,
  ) {
    return call(
      ids: provider.ids,
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
  String? get name => r'fetchUsersProvider';
}

/// See also [fetchUsers].
class FetchUsersProvider extends AutoDisposeFutureProvider<List<UserModel>> {
  /// See also [fetchUsers].
  FetchUsersProvider({
    required List<String> ids,
  }) : this._internal(
          (ref) => fetchUsers(
            ref as FetchUsersRef,
            ids: ids,
          ),
          from: fetchUsersProvider,
          name: r'fetchUsersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchUsersHash,
          dependencies: FetchUsersFamily._dependencies,
          allTransitiveDependencies:
              FetchUsersFamily._allTransitiveDependencies,
          ids: ids,
        );

  FetchUsersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.ids,
  }) : super.internal();

  final List<String> ids;

  @override
  Override overrideWith(
    FutureOr<List<UserModel>> Function(FetchUsersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchUsersProvider._internal(
        (ref) => create(ref as FetchUsersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        ids: ids,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<UserModel>> createElement() {
    return _FetchUsersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchUsersProvider && other.ids == ids;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, ids.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchUsersRef on AutoDisposeFutureProviderRef<List<UserModel>> {
  /// The parameter `ids` of this provider.
  List<String> get ids;
}

class _FetchUsersProviderElement
    extends AutoDisposeFutureProviderElement<List<UserModel>>
    with FetchUsersRef {
  _FetchUsersProviderElement(super.provider);

  @override
  List<String> get ids => (origin as FetchUsersProvider).ids;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
