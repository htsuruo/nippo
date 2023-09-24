import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fir_user_provider.g.dart';

@riverpod
Future<bool> isSignedIn(IsSignedInRef ref) {
  return ref.watch(firUserProvider.future).then((user) => user != null);
}

@riverpod
Stream<User?> firUser(FirUserRef ref) {
  return FirebaseAuth.instance.authStateChanges();
}
