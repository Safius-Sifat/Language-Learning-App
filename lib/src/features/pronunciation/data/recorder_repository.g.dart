// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recorder_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recorderRepositoryHash() =>
    r'95d0dbdbce071f48e97d938e1aca413105287e45';

/// See also [recorderRepository].
@ProviderFor(recorderRepository)
final recorderRepositoryProvider =
    AutoDisposeProvider<RecorderRepository>.internal(
  recorderRepository,
  name: r'recorderRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$recorderRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RecorderRepositoryRef = AutoDisposeProviderRef<RecorderRepository>;
String _$recorderStateHash() => r'6642e87cebbe75f0af7f1e80e81dbe8bcbdb5a71';

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

/// See also [recorderState].
@ProviderFor(recorderState)
const recorderStateProvider = RecorderStateFamily();

/// See also [recorderState].
class RecorderStateFamily extends Family<AsyncValue<RecorderState>> {
  /// See also [recorderState].
  const RecorderStateFamily();

  /// See also [recorderState].
  RecorderStateProvider call(
    RecorderController controller,
  ) {
    return RecorderStateProvider(
      controller,
    );
  }

  @override
  RecorderStateProvider getProviderOverride(
    covariant RecorderStateProvider provider,
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
  String? get name => r'recorderStateProvider';
}

/// See also [recorderState].
class RecorderStateProvider extends AutoDisposeStreamProvider<RecorderState> {
  /// See also [recorderState].
  RecorderStateProvider(
    RecorderController controller,
  ) : this._internal(
          (ref) => recorderState(
            ref as RecorderStateRef,
            controller,
          ),
          from: recorderStateProvider,
          name: r'recorderStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$recorderStateHash,
          dependencies: RecorderStateFamily._dependencies,
          allTransitiveDependencies:
              RecorderStateFamily._allTransitiveDependencies,
          controller: controller,
        );

  RecorderStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.controller,
  }) : super.internal();

  final RecorderController controller;

  @override
  Override overrideWith(
    Stream<RecorderState> Function(RecorderStateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RecorderStateProvider._internal(
        (ref) => create(ref as RecorderStateRef),
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
  AutoDisposeStreamProviderElement<RecorderState> createElement() {
    return _RecorderStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecorderStateProvider && other.controller == controller;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, controller.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RecorderStateRef on AutoDisposeStreamProviderRef<RecorderState> {
  /// The parameter `controller` of this provider.
  RecorderController get controller;
}

class _RecorderStateProviderElement
    extends AutoDisposeStreamProviderElement<RecorderState>
    with RecorderStateRef {
  _RecorderStateProviderElement(super.provider);

  @override
  RecorderController get controller =>
      (origin as RecorderStateProvider).controller;
}

String _$recordingDurationHash() => r'533f7d13da728d1cc3c76d41b62bdb9ad35ca003';

/// See also [recordingDuration].
@ProviderFor(recordingDuration)
const recordingDurationProvider = RecordingDurationFamily();

/// See also [recordingDuration].
class RecordingDurationFamily extends Family<AsyncValue<Duration>> {
  /// See also [recordingDuration].
  const RecordingDurationFamily();

  /// See also [recordingDuration].
  RecordingDurationProvider call(
    RecorderController controller,
  ) {
    return RecordingDurationProvider(
      controller,
    );
  }

  @override
  RecordingDurationProvider getProviderOverride(
    covariant RecordingDurationProvider provider,
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
  String? get name => r'recordingDurationProvider';
}

/// See also [recordingDuration].
class RecordingDurationProvider extends AutoDisposeStreamProvider<Duration> {
  /// See also [recordingDuration].
  RecordingDurationProvider(
    RecorderController controller,
  ) : this._internal(
          (ref) => recordingDuration(
            ref as RecordingDurationRef,
            controller,
          ),
          from: recordingDurationProvider,
          name: r'recordingDurationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$recordingDurationHash,
          dependencies: RecordingDurationFamily._dependencies,
          allTransitiveDependencies:
              RecordingDurationFamily._allTransitiveDependencies,
          controller: controller,
        );

  RecordingDurationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.controller,
  }) : super.internal();

  final RecorderController controller;

  @override
  Override overrideWith(
    Stream<Duration> Function(RecordingDurationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RecordingDurationProvider._internal(
        (ref) => create(ref as RecordingDurationRef),
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
  AutoDisposeStreamProviderElement<Duration> createElement() {
    return _RecordingDurationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecordingDurationProvider && other.controller == controller;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, controller.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RecordingDurationRef on AutoDisposeStreamProviderRef<Duration> {
  /// The parameter `controller` of this provider.
  RecorderController get controller;
}

class _RecordingDurationProviderElement
    extends AutoDisposeStreamProviderElement<Duration>
    with RecordingDurationRef {
  _RecordingDurationProviderElement(super.provider);

  @override
  RecorderController get controller =>
      (origin as RecordingDurationProvider).controller;
}

String _$finalRecordedDurationHash() =>
    r'45b1da9a7ba079c369313270eedd30907b6ab286';

/// See also [finalRecordedDuration].
@ProviderFor(finalRecordedDuration)
const finalRecordedDurationProvider = FinalRecordedDurationFamily();

/// See also [finalRecordedDuration].
class FinalRecordedDurationFamily extends Family<Duration> {
  /// See also [finalRecordedDuration].
  const FinalRecordedDurationFamily();

  /// See also [finalRecordedDuration].
  FinalRecordedDurationProvider call(
    RecorderController controller,
  ) {
    return FinalRecordedDurationProvider(
      controller,
    );
  }

  @override
  FinalRecordedDurationProvider getProviderOverride(
    covariant FinalRecordedDurationProvider provider,
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
  String? get name => r'finalRecordedDurationProvider';
}

/// See also [finalRecordedDuration].
class FinalRecordedDurationProvider extends AutoDisposeProvider<Duration> {
  /// See also [finalRecordedDuration].
  FinalRecordedDurationProvider(
    RecorderController controller,
  ) : this._internal(
          (ref) => finalRecordedDuration(
            ref as FinalRecordedDurationRef,
            controller,
          ),
          from: finalRecordedDurationProvider,
          name: r'finalRecordedDurationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$finalRecordedDurationHash,
          dependencies: FinalRecordedDurationFamily._dependencies,
          allTransitiveDependencies:
              FinalRecordedDurationFamily._allTransitiveDependencies,
          controller: controller,
        );

  FinalRecordedDurationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.controller,
  }) : super.internal();

  final RecorderController controller;

  @override
  Override overrideWith(
    Duration Function(FinalRecordedDurationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FinalRecordedDurationProvider._internal(
        (ref) => create(ref as FinalRecordedDurationRef),
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
  AutoDisposeProviderElement<Duration> createElement() {
    return _FinalRecordedDurationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FinalRecordedDurationProvider &&
        other.controller == controller;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, controller.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FinalRecordedDurationRef on AutoDisposeProviderRef<Duration> {
  /// The parameter `controller` of this provider.
  RecorderController get controller;
}

class _FinalRecordedDurationProviderElement
    extends AutoDisposeProviderElement<Duration> with FinalRecordedDurationRef {
  _FinalRecordedDurationProviderElement(super.provider);

  @override
  RecorderController get controller =>
      (origin as FinalRecordedDurationProvider).controller;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
