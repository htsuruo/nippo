import 'package:flutter/material.dart';
import 'package:nippo/pages/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nippo/components/app_logo.dart';
import 'package:nippo/pages/home.dart';

Future<bool> isLogin() async {
  final _auth = FirebaseAuth.instance;
  try {
    var user = await _auth.currentUser();
    if (user != null) {
      return true;
    }
  } catch (e) {
    print(e);
  }
  return false;
}

class SplashPage extends StatefulWidget {
  static final String routeName = '/splash';

  @override
  _SplashPageState createState() => new _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(const Duration(seconds: 2))
        .then((value) => handleTimeout());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        // TODO: スプラッシュアニメーション
        child: Hero(
          child: AppLogo(height: 240),
          tag: 'appLogo',
        ),
      ),
    );
  }

  void handleTimeout() async {
    if (await isLogin()) {
      // ホーム画面へ
      Navigator.of(context).pushReplacementNamed(HomePage.routeName);
      return;
    }
    Navigator.of(context).pushReplacementNamed(SignInPage.routeName);
  }
}
