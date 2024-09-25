// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'post_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postsHash() => r'0801cab42b4e213141541e13762c3d266fc2bfe2';

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
String _$postHash() => r'ac9db26baec705ea3a36a3f8c99f536129c3b991';

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
    String? postId,
    String? uid,
  }) : this._internal(
          (ref) => post(
            ref as PostRef,
            postId: postId,
            uid: uid,
          ),
          from: postProvider,
          name: r'postProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$postHash,
          dependencies: PostFamily._dependencies,
          allTransitiveDependencies: PostFamily._allTransitiveDependencies,
          postId: postId,
          uid: uid,
        );

  PostProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postId,
    required this.uid,
  }) : super.internal();

  final String? postId;
  final String? uid;

  @override
  Override overrideWith(
    Stream<DocumentSnapshot<Post>?> Function(PostRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostProvider._internal(
        (ref) => create(ref as PostRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postId: postId,
        uid: uid,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<DocumentSnapshot<Post>?> createElement() {
    return _PostProviderElement(this);
  }

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

mixin PostRef on AutoDisposeStreamProviderRef<DocumentSnapshot<Post>?> {
  /// The parameter `postId` of this provider.
  String? get postId;

  /// The parameter `uid` of this provider.
  String? get uid;
}

class _PostProviderElement
    extends AutoDisposeStreamProviderElement<DocumentSnapshot<Post>?>
    with PostRef {
  _PostProviderElement(super.provider);

  @override
  String? get postId => (origin as PostProvider).postId;
  @override
  String? get uid => (origin as PostProvider).uid;
}

String _$userPostsHash() => r'4236a1c8ed5ed6e3523a71242fde520555b5ea84';

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
    String uid,
  ) : this._internal(
          (ref) => userPosts(
            ref as UserPostsRef,
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
          uid: uid,
        );

  UserPostsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uid,
  }) : super.internal();

  final String uid;

  @override
  Override overrideWith(
    Stream<List<QueryDocumentSnapshot<Post>>> Function(UserPostsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserPostsProvider._internal(
        (ref) => create(ref as UserPostsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uid: uid,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<QueryDocumentSnapshot<Post>>>
      createElement() {
    return _UserPostsProviderElement(this);
  }

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

mixin UserPostsRef
    on AutoDisposeStreamProviderRef<List<QueryDocumentSnapshot<Post>>> {
  /// The parameter `uid` of this provider.
  String get uid;
}

class _UserPostsProviderElement
    extends AutoDisposeStreamProviderElement<List<QueryDocumentSnapshot<Post>>>
    with UserPostsRef {
  _UserPostsProviderElement(super.provider);

  @override
  String get uid => (origin as UserPostsProvider).uid;
}

String _$selfPostRefHash() => r'31cc7f347a2b5467b8ad6ea5994133f1fc9a1686';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
