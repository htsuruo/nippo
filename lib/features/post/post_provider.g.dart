// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'post_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postsHash() => r'b8d0329b16f935c2b0115ac717016afa8a0b8880';

/// See also [posts].
@ProviderFor(posts)
final postsProvider =
    AutoDisposeStreamProvider<List<QueryDocumentSnapshot<Post>>>.internal(
  posts,
  name: r'postsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$postsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PostsRef
    = AutoDisposeStreamProviderRef<List<QueryDocumentSnapshot<Post>>>;
String _$userPostsHash() => r'83f5d27a1e5f87552c4bce030b4bf93bc9772ce4';

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

typedef UserPostsRef
    = AutoDisposeStreamProviderRef<List<QueryDocumentSnapshot<Post>>>;

/// See also [userPosts].
@ProviderFor(userPosts)
const userPostsProvider = UserPostsFamily();

/// See also [userPosts].
class UserPostsFamily
    extends Family<AsyncValue<List<QueryDocumentSnapshot<Post>>>> {
  /// See also [userPosts].
  const UserPostsFamily();

  /// See also [userPosts].
  UserPostsProvider call(
    String uid,
  ) {
    return UserPostsProvider(
      uid,
    );
  }

  @override
  UserPostsProvider getProviderOverride(
    covariant UserPostsProvider provider,
  ) {
    return call(
      provider.uid,
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
  String? get name => r'userPostsProvider';
}

/// See also [userPosts].
class UserPostsProvider
    extends AutoDisposeStreamProvider<List<QueryDocumentSnapshot<Post>>> {
  /// See also [userPosts].
  UserPostsProvider(
    this.uid,
  ) : super.internal(
          (ref) => userPosts(
            ref,
            uid,
          ),
          from: userPostsProvider,
          name: r'userPostsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userPostsHash,
          dependencies: UserPostsFamily._dependencies,
          allTransitiveDependencies: UserPostsFamily._allTransitiveDependencies,
        );

  final String uid;

  @override
  bool operator ==(Object other) {
    return other is UserPostsProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$selfPostRefHash() => r'cd5bb07b848f305c913174e9037de7a67827d069';

/// See also [selfPostRef].
@ProviderFor(selfPostRef)
final selfPostRefProvider =
    AutoDisposeProvider<CollectionReference<Post>>.internal(
  selfPostRef,
  name: r'selfPostRefProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$selfPostRefHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SelfPostRefRef = AutoDisposeProviderRef<CollectionReference<Post>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
