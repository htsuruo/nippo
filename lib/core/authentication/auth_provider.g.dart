// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isSignedInHash() => r'c27def8c3f17926899bb150f850224c6e81baee4';

/// See also [isSignedIn].
@ProviderFor(isSignedIn)
final isSignedInProvider = AutoDisposeFutureProvider<bool>.internal(
  isSignedIn,
  name: r'isSignedInProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isSignedInHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsSignedInRef = AutoDisposeFutureProviderRef<bool>;
String _$firUserHash() => r'2c8d62d3e4771d17671a88a5b544ef02f4118a5c';

/// See also [firUser].
@ProviderFor(firUser)
final firUserProvider = AutoDisposeStreamProvider<User?>.internal(
  firUser,
  name: r'firUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$firUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirUserRef = AutoDisposeStreamProviderRef<User?>;
String _$uidHash() => r'd0e59e78004a00da827925b949c4ee9df593a95b';

/// See also [uid].
@ProviderFor(uid)
final uidProvider = AutoDisposeFutureProvider<String>.internal(
  uid,
  name: r'uidProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$uidHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UidRef = AutoDisposeFutureProviderRef<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
