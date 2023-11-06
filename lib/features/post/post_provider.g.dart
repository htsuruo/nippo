// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'post_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postsHash() => r'fccba1be3d94abb9d6b492dc0c7947d07ff74f05';

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
String _$postHash() => r'f7cef37382fab330584d0a441c0fa579f6a22554';

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

typedef PostRef = AutoDisposeStreamProviderRef<DocumentSnapshot<Post>?>;

/// See also [post].
@ProviderFor(post)
const postProvider = PostFamily();

/// See also [post].
class PostFamily extends Family<AsyncValue<DocumentSnapshot<Post>?>> {
  /// See also [post].
  const PostFamily();

  /// See also [post].
  PostProvider call({
    String? postId,
    String? uid,
  }) {
    return PostProvider(
      postId: postId,
      uid: uid,
    );
  }

  @override
  PostProvider getProviderOverride(
    covariant PostProvider provider,
  ) {
    return call(
      postId: provider.postId,
      uid: provider.uid,
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
  String? get name => r'postProvider';
}

/// See also [post].
class PostProvider extends AutoDisposeStreamProvider<DocumentSnapshot<Post>?> {
  /// See also [post].
  PostProvider({
    this.postId,
    this.uid,
  }) : super.internal(
          (ref) => post(
            ref,
            postId: postId,
            uid: uid,
          ),
          from: postProvider,
          name: r'postProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$postHash,
          dependencies: PostFamily._dependencies,
          allTransitiveDependencies: PostFamily._allTransitiveDependencies,
        );

  final String? postId;
  final String? uid;

  @override
  bool operator ==(Object other) {
    return other is PostProvider && other.postId == postId && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$userPostsHash() => r'2af8c30f1c8ff8c466e00462e99b5e2561d1ff7e';
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

String _$selfPostRefHash() => r'2471af5db201a20b96bd7ef9c6a7b3896f5b77b9';

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
