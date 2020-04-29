import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nippo/components/app_logo.dart';
import 'package:nippo/pages/home.dart';
import 'package:nippo/pages/signin.dart';

Future<bool> isLogin() async {
  final _auth = FirebaseAuth.instance;
  try {
    final user = await _auth.currentUser();
    if (user != null) {
      return true;
    }
  } on Exception catch (e) {
    print(e);
  }
  return false;
}

class SplashPage extends StatefulWidget {
  static const String routeName = '/splash';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    setTimeout();
    handleTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        // TODO(tsuruoka): スプラッシュアニメーション
        child: Hero(
          child: AppLogo(height: 240),
          tag: 'appLogo',
        ),
      ),
    );
  }

  Future<void> setTimeout() async {
    await Future<bool>.delayed(const Duration(seconds: 2));
  }

  Future<void> handleTimeout() async {
    if (await isLogin()) {
      // ホーム画面へ
      await Navigator.of(context).pushReplacementNamed(HomePage.routeName);
      return;
    }
    await Navigator.of(context).pushReplacementNamed(SignInPage.routeName);
  }
}
