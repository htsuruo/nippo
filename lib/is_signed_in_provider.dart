import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_signed_in_provider.g.dart';

@riverpod
Future<bool> isSignedIn(IsSignedInRef ref) {
  return ref
      .watch(authStateChangesProvider.future)
      .then((user) => user != null);
}

@riverpod
Stream<User?> authStateChanges(AuthStateChangesRef ref) {
  return FirebaseAuth.instance.authStateChanges();
}
