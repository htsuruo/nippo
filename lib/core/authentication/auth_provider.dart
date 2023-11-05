import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
Future<bool> isSignedIn(IsSignedInRef ref) {
  return ref.watch(firUserProvider.future).then((user) => user != null);
}

@Riverpod(keepAlive: true)
Stream<User?> firUser(FirUserRef ref) {
  return FirebaseAuth.instance.authStateChanges();
}
