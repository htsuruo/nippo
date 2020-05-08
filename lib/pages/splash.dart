import 'package:flutter/material.dart';
import 'package:nippo/components/app_logo.dart';
import 'package:nippo/repositories/user_repository.dart';
import 'package:nippo/services/auth.dart';
import 'package:nippo/pages/home.dart';
import 'package:nippo/pages/signin.dart';
import 'package:nippo/states/user_state.dart';
import 'package:provider/provider.dart';

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
        Provider.of<UserController>(context, listen: false)
            .updateData(user: currentUser);
        Navigator.of(context).pushReplacementNamed(HomePage.routeName);
        return;
      }
    }
    Navigator.of(context).pushReplacementNamed(SignInPage.routeName);
  }
}
