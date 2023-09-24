import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
      throw Exception('GoogleSignInAccount is null');
    }
    final googleAuth = await googleAccount.authentication;
    if (googleAuth.idToken == null || googleAuth.accessToken == null) {
      throw Exception(
        'Google Signin Failed because idToken or accessToken is null',
      );
    }
    await _auth.signInWithCredential(
      GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      ),
    );
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
