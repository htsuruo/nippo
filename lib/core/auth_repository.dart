import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nippo/features/user/model/user.dart' as app;
import 'package:nippo/util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  app.User _getUserData(User firUser) {
    _setSharedPreference();
    return app.User(
      uid: firUser.uid,
      email: firUser.email ?? '',
      displayName: firUser.displayName ?? '',
      photoUrl: firUser.photoURL ?? '',
      lastSignInTime:
          formatDateFromDateTime(datetime: firUser.metadata.lastSignInTime!),
      providerData: _getProviderData(firUser),
    );
  }

  String _getProviderData(User user) {
    final providerIds = <String>[];
    for (final profile in user.providerData) {
      providerIds.add(profile.providerId);
    }
    return providerIds.first;
  }

  Future<void> _setSharedPreference() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('isTutorial_done', 1);
  }

  Future<bool> isLogin() async {
    final user = await currentUser();
    return user != null;
  }

  Future<app.User?> currentUser() async {
    final user = _firebaseAuth.currentUser;
    return user == null ? null : _getUserData(user);
  }

  Future<app.User?> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return null;
    }
    final googleAuth = await googleUser.authentication;
    if (googleAuth.idToken == null || googleAuth.accessToken == null) {
      return null;
    }
    final result = await _firebaseAuth.signInWithCredential(
      GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      ),
    );
    return _getUserData(result.user!);
  }

  Future<Map<String, Object>> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    final map = <String, Object>{'user': '', 'result': false, 'message': ''};
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      map['user'] = _getUserData(result.user!);
      map['result'] = true;
    } on PlatformException catch (e) {
      print(e);
      map['message'] = e.toString();
    }
    return map;
  }

  Future<Map<String, Object>> signInWithEmail({
    required String email,
    required String password,
  }) async {
    final map = <String, Object>{'user': '', 'result': false, 'message': ''};
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      map['user'] = _getUserData(result.user!);
      map['result'] = true;
    } on PlatformException catch (e) {
      print(e);
      map['message'] = e.toString();
    }
    return map;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    print('signout success.');
  }
}
