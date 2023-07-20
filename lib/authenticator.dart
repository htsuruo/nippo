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
    final googleSignIn = GoogleSignIn(
      clientId:
          '554602506203-34j678spmk1vgfn2qgcj5jh9fhn6ulb5.apps.googleusercontent.com',
    );
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return;
    }
    final googleAuth = await googleUser.authentication;
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
