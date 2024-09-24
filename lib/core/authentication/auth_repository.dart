import 'dart:io';

import 'package:desktop_webview_auth/desktop_webview_auth.dart';
import 'package:desktop_webview_auth/google.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) => AuthRepository();

class AuthRepository {
  final _auth = FirebaseAuth.instance;

  // `google_sign_in`プラグインパッケージでサポートされているプラットフォーム
  final _isPackageSupportPlatform =
      kIsWeb || Platform.isIOS || Platform.isAndroid;

  static const _clientId =
      // ignore: lines_longer_than_80_chars
      '554602506203-gv6vpvdndlppghdn3sv9cr2n3fc4d854.apps.googleusercontent.com';
  static const _scopes = [
    'email',
    // Googleアカウント名やプロフィール画像の取得に必要
    // ref. https://developers.google.com/identity/protocols/oauth2/scopes?hl=ja#people
    'https://www.googleapis.com/auth/userinfo.profile',
  ];

  Future<void> signOut() => _auth.signOut();

  Future<void> signInWithGoogle() async {
    final (:idToken, :accessToken) = await (_isPackageSupportPlatform
        ? _signInWithGoogleAccount()
        : _signInWithDesktop());
    if (idToken == null || accessToken == null) {
      throw Exception(
        'Google Signin Failed because idToken or accessToken is null',
      );
    }
    await _auth.signInWithCredential(
      GoogleAuthProvider.credential(
        idToken: idToken,
        accessToken: accessToken,
      ),
    );
  }

  // v0.12からGIS(Google Identity Services)方式に変更となっている
  // ref. https://pub.dev/packages/google_sign_in_web
  Future<GoogleSignInAccount?> _signInWithWeb() async {
    final googleSignIn = GoogleSignIn(clientId: _clientId);
    final res = await googleSignIn.requestScopes(_scopes);
    return res ? googleSignIn.signInSilently() : null;
  }

  Future<({String? idToken, String? accessToken})>
      _signInWithGoogleAccount() async {
    final googleAccount = await (kIsWeb
        ? _signInWithWeb()
        : GoogleSignIn(scopes: _scopes).signIn());
    if (googleAccount == null) {
      throw Exception('GoogleSignInAccount is null');
    }
    final googleAuth = await googleAccount.authentication;
    return (idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
  }

  Future<({String? idToken, String? accessToken})> _signInWithDesktop() async {
    final args = GoogleSignInArgs(
      clientId: _clientId,
      redirectUri: 'https://nippo-e8922.firebaseapp.com/__/auth/handler',
      // scopeがListではなくStringで指定する必要があるが、半角スペース（カンマではNG）で複数指定できることを確認。
      // ref. https://github.com/invertase/flutter_desktop_webview_auth/issues/48
      scope: _scopes.join(' '),
    );
    final res = await DesktopWebviewAuth.signIn(args);
    return (idToken: res?.idToken, accessToken: res?.accessToken);
  }
}
