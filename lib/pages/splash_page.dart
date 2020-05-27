import 'package:flutter/material.dart';
import 'package:nippo/components/atoms/app_logo.dart';
import 'package:nippo/constant.dart';
import 'package:nippo/models/controllers/auth_controller/auth_controller.dart';
import 'package:nippo/models/repositories/auth_repository.dart';
import 'package:nippo/models/repositories/user_repository.dart';
import 'package:nippo/pages/auth/sign_in_page.dart';
import 'package:nippo/pages/base_page.dart';
import 'package:nippo/pages/tutorial_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/splash';

  @override
  _SplashPageState createState() => _SplashPageState();
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
          child: AppLogo(height: 240),
          tag: 'appLogo',
        ),
      ),
    );
  }

//  これだと意図した動作にならない.
//  Future<void> setTimeout() async {
//    await Future<bool>.delayed(const Duration(seconds: 2));
//  }

  Future<void> handleTimeout() async {
    if (await Auth().isLogin()) {
      final authUser = await Auth().currentUser();
      final currentUser = await UserRepository().fetchOne(uid: authUser.uid);
      if (currentUser != null) {
        context.read<AuthController>().updateData(user: currentUser);
        Navigator.of(context).pushReplacementNamed(BasePage.routeName);
        return;
      }
    }
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getInt(Pref.IS_TUTORIAL_DONE) == 1) {
      Navigator.of(context).pushReplacementNamed(SignInPage.routeName);
      return;
    }
    Navigator.of(context).pushReplacementNamed(TutorialPage.routeName);
  }
}
