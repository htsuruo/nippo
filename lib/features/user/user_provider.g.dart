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

typedef UserRefRef = ProviderRef<DocumentReference<User>>;

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
    this.uid,
  ) : super.internal(
          (ref) => userRef(
            ref,
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
        );

  final String? uid;

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

String _$userHash() => r'3d569a61a339756f549c24d2b3dc78cf65e2aca9';
typedef UserRef = AutoDisposeStreamProviderRef<DocumentSnapshot<User>>;

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
    required this.uid,
  }) : super.internal(
          (ref) => user(
            ref,
            uid: uid,
          ),
          from: userProvider,
          name: r'userProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$userHash,
          dependencies: UserFamily._dependencies,
          allTransitiveDependencies: UserFamily._allTransitiveDependencies,
        );

  final String? uid;

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
