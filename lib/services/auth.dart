import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

// ModelのようなEntityのようなもの
class User {
  User({
    @required this.uid,
    this.email,
    this.photoUrl,
    this.displayName,
    this.providerData,
    this.lastSignInTime,
  });
  final String uid;
  final String email;
  final String photoUrl;
  final String displayName;
  final String providerData;
  final DateTime lastSignInTime;
}

// Interfaceっぽいもの（DartにはInterface修飾子がない）
abstract class AuthBase {
  Future<bool> isLogin();
  Future<User> currentUser();
  Future<User> signInWithGoogle();
  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  User _getUserData(FirebaseUser user) {
    if (user == null) {
      return null;
    }
    print('sign in [ ${user.email} ], [ ${user.displayName} ]');
    return User(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoUrl: user.photoUrl,
      lastSignInTime: user.metadata.lastSignInTime,
      providerData: _getProviderData(user),
    );
  }

  String _getProviderData(FirebaseUser user) {
    String providerId;
    for (final profile in user.providerData) {
      providerId = profile.providerId;
    }
    return providerId;
  }

  @override
  Future<bool> isLogin() async {
    // TODO(tsuruo): implement isLogin
    final user = await currentUser();
    print('current user is [ ${user != null || false} ]');
    return user != null || false;
  }

  @override
  Future<User> currentUser() async {
    // TODO(tsuruo): implement currentUser
    final user = await _firebaseAuth.currentUser();
    return _getUserData(user);
  }

  @override
  Future<User> signInWithGoogle() async {
    // TODO(tsuruo): implement signInWithGoogle
    final _googleSignIn = GoogleSignIn();
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      return null;
    }
    final googleAuth = await googleUser.authentication;
    if (googleAuth.idToken == null || googleAuth.accessToken == null) {
      return null;
    }
    final result = await _firebaseAuth.signInWithCredential(
        GoogleAuthProvider.getCredential(
            idToken: googleAuth.idToken, accessToken: googleAuth.accessToken));
    return _getUserData(result.user);
  }

  @override
  Future<void> signOut() async {
    // TODO(tsuruo): implement signOut
    await _firebaseAuth.signOut();
    print('signout success.');
  }
}
