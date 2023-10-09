// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'post_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userPostRefHash() => r'3cf5791b61c81c67f2152b9f04a12b4c7dadaab7';

/// See also [userPostRef].
@ProviderFor(userPostRef)
final userPostRefProvider =
    AutoDisposeProvider<CollectionReference<Post>>.internal(
  userPostRef,
  name: r'userPostRefProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userPostRefHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserPostRefRef = AutoDisposeProviderRef<CollectionReference<Post>>;
String _$postsHash() => r'ae03d1d425f02d183d7ede573f037921ebd6fcb6';

/// See also [posts].
@ProviderFor(posts)
final postsProvider = AutoDisposeStreamProvider<List<Post>>.internal(
  posts,
  name: r'postsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$postsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PostsRef = AutoDisposeStreamProviderRef<List<Post>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
