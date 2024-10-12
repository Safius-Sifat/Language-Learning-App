// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pronunciation_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pronunciationRepositoryHash() =>
    r'4fb3691ba7c9cd53a3bf75f445c5b240bb755ee9';

/// See also [pronunciationRepository].
@ProviderFor(pronunciationRepository)
final pronunciationRepositoryProvider =
    AutoDisposeProvider<PronunciationRepository>.internal(
  pronunciationRepository,
  name: r'pronunciationRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pronunciationRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PronunciationRepositoryRef
    = AutoDisposeProviderRef<PronunciationRepository>;
String _$getAudioFromAssetsHash() =>
    r'4e0950ca47ae66e19db948218ba89ac481b66fb5';

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

/// See also [getAudioFromAssets].
@ProviderFor(getAudioFromAssets)
const getAudioFromAssetsProvider = GetAudioFromAssetsFamily();

/// See also [getAudioFromAssets].
class GetAudioFromAssetsFamily extends Family<AsyncValue<void>> {
  /// See also [getAudioFromAssets].
  const GetAudioFromAssetsFamily();

  /// See also [getAudioFromAssets].
  GetAudioFromAssetsProvider call(
    PlayerController controller,
    bool fromAsset, {
    String? downloadUrl,
  }) {
    return GetAudioFromAssetsProvider(
      controller,
      fromAsset,
      downloadUrl: downloadUrl,
    );
  }

  @override
  GetAudioFromAssetsProvider getProviderOverride(
    covariant GetAudioFromAssetsProvider provider,
  ) {
    return call(
      provider.controller,
      provider.fromAsset,
      downloadUrl: provider.downloadUrl,
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
  String? get name => r'getAudioFromAssetsProvider';
}

/// See also [getAudioFromAssets].
class GetAudioFromAssetsProvider extends AutoDisposeFutureProvider<void> {
  /// See also [getAudioFromAssets].
  GetAudioFromAssetsProvider(
    PlayerController controller,
    bool fromAsset, {
    String? downloadUrl,
  }) : this._internal(
          (ref) => getAudioFromAssets(
            ref as GetAudioFromAssetsRef,
            controller,
            fromAsset,
            downloadUrl: downloadUrl,
          ),
          from: getAudioFromAssetsProvider,
          name: r'getAudioFromAssetsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAudioFromAssetsHash,
          dependencies: GetAudioFromAssetsFamily._dependencies,
          allTransitiveDependencies:
              GetAudioFromAssetsFamily._allTransitiveDependencies,
          controller: controller,
          fromAsset: fromAsset,
          downloadUrl: downloadUrl,
        );

  GetAudioFromAssetsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.controller,
    required this.fromAsset,
    required this.downloadUrl,
  }) : super.internal();

  final PlayerController controller;
  final bool fromAsset;
  final String? downloadUrl;

  @override
  Override overrideWith(
    FutureOr<void> Function(GetAudioFromAssetsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAudioFromAssetsProvider._internal(
        (ref) => create(ref as GetAudioFromAssetsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        controller: controller,
        fromAsset: fromAsset,
        downloadUrl: downloadUrl,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _GetAudioFromAssetsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAudioFromAssetsProvider &&
        other.controller == controller &&
        other.fromAsset == fromAsset &&
        other.downloadUrl == downloadUrl;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, controller.hashCode);
    hash = _SystemHash.combine(hash, fromAsset.hashCode);
    hash = _SystemHash.combine(hash, downloadUrl.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetAudioFromAssetsRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `controller` of this provider.
  PlayerController get controller;

  /// The parameter `fromAsset` of this provider.
  bool get fromAsset;

  /// The parameter `downloadUrl` of this provider.
  String? get downloadUrl;
}

class _GetAudioFromAssetsProviderElement
    extends AutoDisposeFutureProviderElement<void> with GetAudioFromAssetsRef {
  _GetAudioFromAssetsProviderElement(super.provider);

  @override
  PlayerController get controller =>
      (origin as GetAudioFromAssetsProvider).controller;
  @override
  bool get fromAsset => (origin as GetAudioFromAssetsProvider).fromAsset;
  @override
  String? get downloadUrl => (origin as GetAudioFromAssetsProvider).downloadUrl;
}

String _$playerStateHash() => r'53df4bfed974f1581e5a6875efab27dc76f0146a';

/// See also [playerState].
@ProviderFor(playerState)
const playerStateProvider = PlayerStateFamily();

/// See also [playerState].
class PlayerStateFamily extends Family<AsyncValue<PlayerState>> {
  /// See also [playerState].
  const PlayerStateFamily();

  /// See also [playerState].
  PlayerStateProvider call(
    PlayerController controller,
  ) {
    return PlayerStateProvider(
      controller,
    );
  }

  @override
  PlayerStateProvider getProviderOverride(
    covariant PlayerStateProvider provider,
  ) {
    return call(
      provider.controller,
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
  String? get name => r'playerStateProvider';
}

/// See also [playerState].
class PlayerStateProvider extends AutoDisposeStreamProvider<PlayerState> {
  /// See also [playerState].
  PlayerStateProvider(
    PlayerController controller,
  ) : this._internal(
          (ref) => playerState(
            ref as PlayerStateRef,
            controller,
          ),
          from: playerStateProvider,
          name: r'playerStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$playerStateHash,
          dependencies: PlayerStateFamily._dependencies,
          allTransitiveDependencies:
              PlayerStateFamily._allTransitiveDependencies,
          controller: controller,
        );

  PlayerStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.controller,
  }) : super.internal();

  final PlayerController controller;

  @override
  Override overrideWith(
    Stream<PlayerState> Function(PlayerStateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PlayerStateProvider._internal(
        (ref) => create(ref as PlayerStateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        controller: controller,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<PlayerState> createElement() {
    return _PlayerStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlayerStateProvider && other.controller == controller;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, controller.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PlayerStateRef on AutoDisposeStreamProviderRef<PlayerState> {
  /// The parameter `controller` of this provider.
  PlayerController get controller;
}

class _PlayerStateProviderElement
    extends AutoDisposeStreamProviderElement<PlayerState> with PlayerStateRef {
  _PlayerStateProviderElement(super.provider);

  @override
  PlayerController get controller => (origin as PlayerStateProvider).controller;
}

String _$getAudioDurationHash() => r'4e5d03352e93aa064c83048b00f0bd25ad82ffbe';

/// See also [getAudioDuration].
@ProviderFor(getAudioDuration)
const getAudioDurationProvider = GetAudioDurationFamily();

/// See also [getAudioDuration].
class GetAudioDurationFamily extends Family<AsyncValue<int>> {
  /// See also [getAudioDuration].
  const GetAudioDurationFamily();

  /// See also [getAudioDuration].
  GetAudioDurationProvider call(
    PlayerController controller,
  ) {
    return GetAudioDurationProvider(
      controller,
    );
  }

  @override
  GetAudioDurationProvider getProviderOverride(
    covariant GetAudioDurationProvider provider,
  ) {
    return call(
      provider.controller,
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
  String? get name => r'getAudioDurationProvider';
}

/// See also [getAudioDuration].
class GetAudioDurationProvider extends AutoDisposeFutureProvider<int> {
  /// See also [getAudioDuration].
  GetAudioDurationProvider(
    PlayerController controller,
  ) : this._internal(
          (ref) => getAudioDuration(
            ref as GetAudioDurationRef,
            controller,
          ),
          from: getAudioDurationProvider,
          name: r'getAudioDurationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAudioDurationHash,
          dependencies: GetAudioDurationFamily._dependencies,
          allTransitiveDependencies:
              GetAudioDurationFamily._allTransitiveDependencies,
          controller: controller,
        );

  GetAudioDurationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.controller,
  }) : super.internal();

  final PlayerController controller;

  @override
  Override overrideWith(
    FutureOr<int> Function(GetAudioDurationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAudioDurationProvider._internal(
        (ref) => create(ref as GetAudioDurationRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        controller: controller,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int> createElement() {
    return _GetAudioDurationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAudioDurationProvider && other.controller == controller;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, controller.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetAudioDurationRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `controller` of this provider.
  PlayerController get controller;
}

class _GetAudioDurationProviderElement
    extends AutoDisposeFutureProviderElement<int> with GetAudioDurationRef {
  _GetAudioDurationProviderElement(super.provider);

  @override
  PlayerController get controller =>
      (origin as GetAudioDurationProvider).controller;
}

String _$dioHash() => r'58eeefbd0832498ca2574c1fe69ed783c58d1d8f';

/// See also [dio].
@ProviderFor(dio)
final dioProvider = AutoDisposeProvider<Dio>.internal(
  dio,
  name: r'dioProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dioHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DioRef = AutoDisposeProviderRef<Dio>;
String _$downloadPercentageHash() =>
    r'9fe7eb5bc10c2d6c347fbe95ee2694150ac572ec';

abstract class _$DownloadPercentage
    extends BuildlessAutoDisposeNotifier<double> {
  late final String downloadUrl;

  double build(
    String downloadUrl,
  );
}

/// See also [DownloadPercentage].
@ProviderFor(DownloadPercentage)
const downloadPercentageProvider = DownloadPercentageFamily();

/// See also [DownloadPercentage].
class DownloadPercentageFamily extends Family<double> {
  /// See also [DownloadPercentage].
  const DownloadPercentageFamily();

  /// See also [DownloadPercentage].
  DownloadPercentageProvider call(
    String downloadUrl,
  ) {
    return DownloadPercentageProvider(
      downloadUrl,
    );
  }

  @override
  DownloadPercentageProvider getProviderOverride(
    covariant DownloadPercentageProvider provider,
  ) {
    return call(
      provider.downloadUrl,
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
  String? get name => r'downloadPercentageProvider';
}

/// See also [DownloadPercentage].
class DownloadPercentageProvider
    extends AutoDisposeNotifierProviderImpl<DownloadPercentage, double> {
  /// See also [DownloadPercentage].
  DownloadPercentageProvider(
    String downloadUrl,
  ) : this._internal(
          () => DownloadPercentage()..downloadUrl = downloadUrl,
          from: downloadPercentageProvider,
          name: r'downloadPercentageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$downloadPercentageHash,
          dependencies: DownloadPercentageFamily._dependencies,
          allTransitiveDependencies:
              DownloadPercentageFamily._allTransitiveDependencies,
          downloadUrl: downloadUrl,
        );

  DownloadPercentageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.downloadUrl,
  }) : super.internal();

  final String downloadUrl;

  @override
  double runNotifierBuild(
    covariant DownloadPercentage notifier,
  ) {
    return notifier.build(
      downloadUrl,
    );
  }

  @override
  Override overrideWith(DownloadPercentage Function() create) {
    return ProviderOverride(
      origin: this,
      override: DownloadPercentageProvider._internal(
        () => create()..downloadUrl = downloadUrl,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        downloadUrl: downloadUrl,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<DownloadPercentage, double>
      createElement() {
    return _DownloadPercentageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DownloadPercentageProvider &&
        other.downloadUrl == downloadUrl;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, downloadUrl.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DownloadPercentageRef on AutoDisposeNotifierProviderRef<double> {
  /// The parameter `downloadUrl` of this provider.
  String get downloadUrl;
}

class _DownloadPercentageProviderElement
    extends AutoDisposeNotifierProviderElement<DownloadPercentage, double>
    with DownloadPercentageRef {
  _DownloadPercentageProviderElement(super.provider);

  @override
  String get downloadUrl => (origin as DownloadPercentageProvider).downloadUrl;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
