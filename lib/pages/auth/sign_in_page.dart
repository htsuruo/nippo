import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:nippo/components/app_logo.dart';
import 'package:nippo/constant.dart';
import 'package:nippo/models/repositories/auth_repository.dart';
import 'package:nippo/models/repositories/user_repository.dart';
import 'package:nippo/pages/auth/register_page.dart';
import 'package:nippo/pages/auth/sign_in_email_page.dart';
import 'package:nippo/pages/auth/signin_sns_button.dart';
import 'package:nippo/pages/base_page.dart';
import 'package:nippo/states/progress_hub_controller.dart';
import 'package:provider/provider.dart';

const double snsLogoHeight = 24;
Image mailLogo = Image(
  image: ExactAssetImage(AssetPath.emailIcon),
  height: snsLogoHeight,
);

Image googleLogo = Image(
  image: ExactAssetImage(AssetPath.googleIcon),
  height: snsLogoHeight,
);

class SignInPage extends StatelessWidget {
  const SignInPage._({Key key}) : super(key: key);
  static const String routeName = '/signin';

  Future<void> signInWithGoogle({BuildContext context}) async {
    try {
      context.read<ProgressHUDController>().update(newState: true);
      final user = await AuthRepository().signInWithGoogle();
      if (user != null) {
        await UserRepository().updateUser(user: user);
        await Navigator.pushReplacementNamed(context, BasePage.routeName);
      }
    } on Exception catch (e) {
      print(e);
    }
    context.read<ProgressHUDController>().update(newState: false);
  }

  void onClickSignInWithEmailButton({BuildContext context}) {
    Navigator.push(
        context,
        MaterialPageRoute<MaterialPageRoute>(
            fullscreenDialog: true,
            builder: (BuildContext context) {
              return SignInEmailPage();
            }));
  }

  static Widget wrapped() {
    return StateNotifierProvider<ProgressHUDController, bool>(
      create: (context) => ProgressHUDController(),
      builder: (context, _child) => const SignInPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: context.select((bool saving) => saving),
      child: Scaffold(
          body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Hero(
                child: AppLogo(height: 160),
                tag: 'appLogo',
              ),
              const SizedBox(
                height: 50,
              ),
              SignInSnsButton(
                logoImg: googleLogo,
                label: 'Sign in with Google',
                onPressed: () async => signInWithGoogle(context: context),
              ),
              const SizedBox(
                height: 24,
              ),
              SignInSnsButton(
                logoImg: mailLogo,
                label: 'Sign in with Email',
                onPressed: () => onClickSignInWithEmailButton(context: context),
              ),
              const SizedBox(
                height: 16,
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterPage.routeName);
                  },
                  child: Text(
                    'アカウント登録はこちら',
                    style: Theme.of(context).textTheme.subtitle2,
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
