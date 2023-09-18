import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'logger.dart';

part 'authenticator.g.dart';

@riverpod
class Authenticator extends _$Authenticator {
  final _auth = FirebaseAuth.instance;

  @override
  void build() {
    return;
  }

  Future<void> signInWithGoogle() async {
    final googleAccount = await GoogleSignIn().signIn();
    if (googleAccount == null) {
      return;
    }
    final googleAuth = await googleAccount.authentication;
    if (googleAuth.idToken == null || googleAuth.accessToken == null) {
      return;
    }
    final result = await _auth.signInWithCredential(
      GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      ),
    );
    logger.info(result);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
