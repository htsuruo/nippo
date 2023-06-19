import 'package:flutter/material.dart';
import 'package:nippo/common/common.dart';
import 'package:nippo/constant.dart';
import 'package:nippo/models/repositories/auth_repository.dart';
import 'package:nippo/pages/auth/sign_in_page.dart';
import 'package:nippo/pages/base_page.dart';
import 'package:nippo/pages/tutorial/tutorial_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static const String routeName = '/splash';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
//    setTimeout();
    Future<void>.delayed(const Duration(seconds: 2))
        .then((value) => handleTimeout());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        // TODO(tsuruoka): スプラッシュアニメーション
        child: Hero(
          tag: 'appLogo',
          child: AppLogo(height: 240),
        ),
      ),
    );
  }

//  これだと意図した動作にならない.
//  Future<void> setTimeout() async {
//    await Future<bool>.delayed(const Duration(seconds: 2));
//  }

  Future<void> handleTimeout() async {
    if (await AuthRepository().isLogin()) {
      await Navigator.of(context).pushReplacementNamed(BasePage.routeName);
      return;
    }
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getInt(Preference.isTutorialDone) == 1) {
      await Navigator.of(context).pushReplacementNamed(SignInPage.routeName);
      return;
    }
    await Navigator.of(context).pushReplacementNamed(TutorialPage.routeName);
  }
}
