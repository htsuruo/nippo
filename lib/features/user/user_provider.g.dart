// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authUserRefHash() => r'd02e05053c7123e1b2804fd58cc332e5052187a2';

/// See also [authUserRef].
@ProviderFor(authUserRef)
final authUserRefProvider = Provider<DocumentReference<User>>.internal(
  authUserRef,
  name: r'authUserRefProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authUserRefHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthUserRefRef = ProviderRef<DocumentReference<User>>;
String _$userRefHash() => r'f5da0ecc758923f69f5be9c659c4b778dfd52026';

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

/// See also [userRef].
@ProviderFor(userRef)
const userRefProvider = UserRefFamily();

/// See also [userRef].
class UserRefFamily extends Family<DocumentReference<User>> {
  /// See also [userRef].
  const UserRefFamily();

  /// See also [userRef].
  UserRefProvider call(
    String? uid,
  ) {
    return UserRefProvider(
      uid,
    );
  }

  @override
  UserRefProvider getProviderOverride(
    covariant UserRefProvider provider,
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
  String? get name => r'userRefProvider';
}

/// See also [userRef].
class UserRefProvider extends Provider<DocumentReference<User>> {
  /// See also [userRef].
  UserRefProvider(
    String? uid,
  ) : this._internal(
          (ref) => userRef(
            ref as UserRefRef,
            uid,
          ),
          from: userRefProvider,
          name: r'userRefProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userRefHash,
          dependencies: UserRefFamily._dependencies,
          allTransitiveDependencies: UserRefFamily._allTransitiveDependencies,
          uid: uid,
        );

  UserRefProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uid,
  }) : super.internal();

  final String? uid;

  @override
  Override overrideWith(
    DocumentReference<User> Function(UserRefRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserRefProvider._internal(
        (ref) => create(ref as UserRefRef),
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
  ProviderElement<DocumentReference<User>> createElement() {
    return _UserRefProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserRefProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserRefRef on ProviderRef<DocumentReference<User>> {
  /// The parameter `uid` of this provider.
  String? get uid;
}

class _UserRefProviderElement extends ProviderElement<DocumentReference<User>>
    with UserRefRef {
  _UserRefProviderElement(super.provider);

  @override
  String? get uid => (origin as UserRefProvider).uid;
}

String _$userHash() => r'3d569a61a339756f549c24d2b3dc78cf65e2aca9';

/// See also [user].
@ProviderFor(user)
const userProvider = UserFamily();

/// See also [user].
class UserFamily extends Family<AsyncValue<DocumentSnapshot<User>>> {
  /// See also [user].
  const UserFamily();

  /// See also [user].
  UserProvider call({
    required String? uid,
  }) {
    return UserProvider(
      uid: uid,
    );
  }

  @override
  UserProvider getProviderOverride(
    covariant UserProvider provider,
  ) {
    return call(
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
  String? get name => r'userProvider';
}

/// See also [user].
class UserProvider extends AutoDisposeStreamProvider<DocumentSnapshot<User>> {
  /// See also [user].
  UserProvider({
    required String? uid,
  }) : this._internal(
          (ref) => user(
            ref as UserRef,
            uid: uid,
          ),
          from: userProvider,
          name: r'userProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$userHash,
          dependencies: UserFamily._dependencies,
          allTransitiveDependencies: UserFamily._allTransitiveDependencies,
          uid: uid,
        );

  UserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uid,
  }) : super.internal();

  final String? uid;

  @override
  Override overrideWith(
    Stream<DocumentSnapshot<User>> Function(UserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserProvider._internal(
        (ref) => create(ref as UserRef),
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
  AutoDisposeStreamProviderElement<DocumentSnapshot<User>> createElement() {
    return _UserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserRef on AutoDisposeStreamProviderRef<DocumentSnapshot<User>> {
  /// The parameter `uid` of this provider.
  String? get uid;
}

class _UserProviderElement
    extends AutoDisposeStreamProviderElement<DocumentSnapshot<User>>
    with UserRef {
  _UserProviderElement(super.provider);

  @override
  String? get uid => (origin as UserProvider).uid;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
