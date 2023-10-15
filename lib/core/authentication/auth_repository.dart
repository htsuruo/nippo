import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) => AuthRepository();

class AuthRepository {
  final _auth = FirebaseAuth.instance;

  Future<GoogleSignInAccount?> _signIn() async {
    return switch (kIsWeb) {
      // v0.12からGIS(Google Identity Services)方式に変更となっている
      // ref. https://pub.dev/packages/google_sign_in_web
      // TODO(htsuruo): このままではaccessTokenを取得できないため修正が必要
      true => await GoogleSignIn(
          clientId:
              // ignore: lines_longer_than_80_chars
              '554602506203-i1vug0gcsln9gn83s29aatni3aftv6oj.apps.googleusercontent.com',
          scopes: [
            'email',
            'https://www.googleapis.com/auth/contacts.readonly',
          ],
        ).signInSilently(),
      false => await GoogleSignIn().signIn()
    };
  }

  Future<void> signInWithGoogle() async {
    final googleAccount = await _signIn();
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

  Future<void> signOut() => _auth.signOut();
}
