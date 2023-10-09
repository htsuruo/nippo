// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userRefHash() => r'f5af154fc27e14eafcfaea31d4f2bc17ace28f09';

/// See also [userRef].
@ProviderFor(userRef)
final userRefProvider = AutoDisposeProvider<DocumentReference<User>>.internal(
  userRef,
  name: r'userRefProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userRefHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserRefRef = AutoDisposeProviderRef<DocumentReference<User>>;
String _$userHash() => r'db0f1c3595ef5d64d0c6d348a6f051db240ba9d3';

/// See also [user].
@ProviderFor(user)
final userProvider = AutoDisposeStreamProvider<DocumentSnapshot<User>>.internal(
  user,
  name: r'userProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserRef = AutoDisposeStreamProviderRef<DocumentSnapshot<User>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
