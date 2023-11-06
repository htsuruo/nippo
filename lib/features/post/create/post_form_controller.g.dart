// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'post_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postFormControllerHash() =>
    r'70f333a3f8a75586ec3ff62306b17c7aab6525e3';

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

abstract class _$PostFormController
    extends BuildlessAutoDisposeAsyncNotifier<PostFormState> {
  late final String? postId;

  FutureOr<PostFormState> build({
    required String? postId,
  });
}

/// See also [PostFormController].
@ProviderFor(PostFormController)
const postFormControllerProvider = PostFormControllerFamily();

/// See also [PostFormController].
class PostFormControllerFamily extends Family<AsyncValue<PostFormState>> {
  /// See also [PostFormController].
  const PostFormControllerFamily();

  /// See also [PostFormController].
  PostFormControllerProvider call({
    required String? postId,
  }) {
    return PostFormControllerProvider(
      postId: postId,
    );
  }

  @override
  PostFormControllerProvider getProviderOverride(
    covariant PostFormControllerProvider provider,
  ) {
    return call(
      postId: provider.postId,
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
  String? get name => r'postFormControllerProvider';
}

/// See also [PostFormController].
class PostFormControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    PostFormController, PostFormState> {
  /// See also [PostFormController].
  PostFormControllerProvider({
    required this.postId,
  }) : super.internal(
          () => PostFormController()..postId = postId,
          from: postFormControllerProvider,
          name: r'postFormControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postFormControllerHash,
          dependencies: PostFormControllerFamily._dependencies,
          allTransitiveDependencies:
              PostFormControllerFamily._allTransitiveDependencies,
        );

  final String? postId;

  @override
  bool operator ==(Object other) {
    return other is PostFormControllerProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<PostFormState> runNotifierBuild(
    covariant PostFormController notifier,
  ) {
    return notifier.build(
      postId: postId,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
