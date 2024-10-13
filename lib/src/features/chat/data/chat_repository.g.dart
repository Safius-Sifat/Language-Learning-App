// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatRepositoryHash() => r'90fc2cdc6c5bb6f7271e6724d543e4748d794923';

/// See also [chatRepository].
@ProviderFor(chatRepository)
final chatRepositoryProvider = AutoDisposeProvider<ChatRepository>.internal(
  chatRepository,
  name: r'chatRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$chatRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ChatRepositoryRef = AutoDisposeProviderRef<ChatRepository>;
String _$lastMessageHash() => r'91c16b746a1ec0699ff788e3a45216b34965d199';

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

/// See also [lastMessage].
@ProviderFor(lastMessage)
const lastMessageProvider = LastMessageFamily();

/// See also [lastMessage].
class LastMessageFamily extends Family<AsyncValue<List<Message>>> {
  /// See also [lastMessage].
  const LastMessageFamily();

  /// See also [lastMessage].
  LastMessageProvider call(
    UserModel user,
  ) {
    return LastMessageProvider(
      user,
    );
  }

  @override
  LastMessageProvider getProviderOverride(
    covariant LastMessageProvider provider,
  ) {
    return call(
      provider.user,
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
  String? get name => r'lastMessageProvider';
}

/// See also [lastMessage].
class LastMessageProvider extends AutoDisposeStreamProvider<List<Message>> {
  /// See also [lastMessage].
  LastMessageProvider(
    UserModel user,
  ) : this._internal(
          (ref) => lastMessage(
            ref as LastMessageRef,
            user,
          ),
          from: lastMessageProvider,
          name: r'lastMessageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$lastMessageHash,
          dependencies: LastMessageFamily._dependencies,
          allTransitiveDependencies:
              LastMessageFamily._allTransitiveDependencies,
          user: user,
        );

  LastMessageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.user,
  }) : super.internal();

  final UserModel user;

  @override
  Override overrideWith(
    Stream<List<Message>> Function(LastMessageRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LastMessageProvider._internal(
        (ref) => create(ref as LastMessageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        user: user,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Message>> createElement() {
    return _LastMessageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LastMessageProvider && other.user == user;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, user.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LastMessageRef on AutoDisposeStreamProviderRef<List<Message>> {
  /// The parameter `user` of this provider.
  UserModel get user;
}

class _LastMessageProviderElement
    extends AutoDisposeStreamProviderElement<List<Message>>
    with LastMessageRef {
  _LastMessageProviderElement(super.provider);

  @override
  UserModel get user => (origin as LastMessageProvider).user;
}

String _$allMessagesHash() => r'c4decf6666c2c889ce3e7e3c666dba1feee945f6';

/// See also [allMessages].
@ProviderFor(allMessages)
const allMessagesProvider = AllMessagesFamily();

/// See also [allMessages].
class AllMessagesFamily extends Family<AsyncValue<List<Message>>> {
  /// See also [allMessages].
  const AllMessagesFamily();

  /// See also [allMessages].
  AllMessagesProvider call(
    UserModel user,
  ) {
    return AllMessagesProvider(
      user,
    );
  }

  @override
  AllMessagesProvider getProviderOverride(
    covariant AllMessagesProvider provider,
  ) {
    return call(
      provider.user,
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
  String? get name => r'allMessagesProvider';
}

/// See also [allMessages].
class AllMessagesProvider extends AutoDisposeStreamProvider<List<Message>> {
  /// See also [allMessages].
  AllMessagesProvider(
    UserModel user,
  ) : this._internal(
          (ref) => allMessages(
            ref as AllMessagesRef,
            user,
          ),
          from: allMessagesProvider,
          name: r'allMessagesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$allMessagesHash,
          dependencies: AllMessagesFamily._dependencies,
          allTransitiveDependencies:
              AllMessagesFamily._allTransitiveDependencies,
          user: user,
        );

  AllMessagesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.user,
  }) : super.internal();

  final UserModel user;

  @override
  Override overrideWith(
    Stream<List<Message>> Function(AllMessagesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AllMessagesProvider._internal(
        (ref) => create(ref as AllMessagesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        user: user,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Message>> createElement() {
    return _AllMessagesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AllMessagesProvider && other.user == user;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, user.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AllMessagesRef on AutoDisposeStreamProviderRef<List<Message>> {
  /// The parameter `user` of this provider.
  UserModel get user;
}

class _AllMessagesProviderElement
    extends AutoDisposeStreamProviderElement<List<Message>>
    with AllMessagesRef {
  _AllMessagesProviderElement(super.provider);

  @override
  UserModel get user => (origin as AllMessagesProvider).user;
}

String _$allGroupMessagesHash() => r'bedb14839455ebbc4812b12912efecfd2ff30219';

/// See also [allGroupMessages].
@ProviderFor(allGroupMessages)
const allGroupMessagesProvider = AllGroupMessagesFamily();

/// See also [allGroupMessages].
class AllGroupMessagesFamily extends Family<AsyncValue<List<Message>>> {
  /// See also [allGroupMessages].
  const AllGroupMessagesFamily();

  /// See also [allGroupMessages].
  AllGroupMessagesProvider call(
    String classroomId,
  ) {
    return AllGroupMessagesProvider(
      classroomId,
    );
  }

  @override
  AllGroupMessagesProvider getProviderOverride(
    covariant AllGroupMessagesProvider provider,
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
  String? get name => r'allGroupMessagesProvider';
}

/// See also [allGroupMessages].
class AllGroupMessagesProvider
    extends AutoDisposeStreamProvider<List<Message>> {
  /// See also [allGroupMessages].
  AllGroupMessagesProvider(
    String classroomId,
  ) : this._internal(
          (ref) => allGroupMessages(
            ref as AllGroupMessagesRef,
            classroomId,
          ),
          from: allGroupMessagesProvider,
          name: r'allGroupMessagesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$allGroupMessagesHash,
          dependencies: AllGroupMessagesFamily._dependencies,
          allTransitiveDependencies:
              AllGroupMessagesFamily._allTransitiveDependencies,
          classroomId: classroomId,
        );

  AllGroupMessagesProvider._internal(
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
    Stream<List<Message>> Function(AllGroupMessagesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AllGroupMessagesProvider._internal(
        (ref) => create(ref as AllGroupMessagesRef),
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
  AutoDisposeStreamProviderElement<List<Message>> createElement() {
    return _AllGroupMessagesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AllGroupMessagesProvider &&
        other.classroomId == classroomId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, classroomId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AllGroupMessagesRef on AutoDisposeStreamProviderRef<List<Message>> {
  /// The parameter `classroomId` of this provider.
  String get classroomId;
}

class _AllGroupMessagesProviderElement
    extends AutoDisposeStreamProviderElement<List<Message>>
    with AllGroupMessagesRef {
  _AllGroupMessagesProviderElement(super.provider);

  @override
  String get classroomId => (origin as AllGroupMessagesProvider).classroomId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
