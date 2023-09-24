import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:nippo/common/common.dart';
import 'package:nippo/features/user/user_repository.dart';
import 'package:nippo/gen/assets.gen.dart';
import 'package:nippo/core/auth_repository.dart';
import 'package:nippo/states/progress_hub_controller.dart';
import 'package:provider/provider.dart';

import '../base/base_page.dart';
import 'register_page.dart';
import 'sign_in_email_page.dart';
import 'signin_sns_button.dart';

const double snsLogoHeight = 24;
Image mailLogo = Image(
  image: ExactAssetImage(Assets.images.icLogoMail.path),
  height: snsLogoHeight,
);

Image googleLogo = Image(
  image: ExactAssetImage(Assets.images.icLogoGoogle.path),
  height: snsLogoHeight,
);

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});
  static const String routeName = '/signin';

  Future<void> signInWithGoogle({required BuildContext context}) async {
    try {
      context.read<ProgressHUDController>().update(newState: true);
      final user = await AuthRepository().signInWithGoogle();
      await UserRepository().updateUser(user: user!);
      await Navigator.pushReplacementNamed(context, BasePage.routeName);
    } on Exception catch (e) {
      print(e);
    }
    context.read<ProgressHUDController>().update(newState: false);
  }

  void onClickSignInWithEmailButton({required BuildContext context}) {
    Navigator.push(
      context,
      MaterialPageRoute<MaterialPageRoute<void>>(
        fullscreenDialog: true,
        builder: (BuildContext context) {
          return SignInEmailPage();
        },
      ),
    );
  }

  static Widget wrapped() {
    return StateNotifierProvider<ProgressHUDController, bool>(
      create: (context) => ProgressHUDController(),
      builder: (context, child) => const SignInPage(),
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
                  tag: 'appLogo',
                  child: AppLogo(height: 160),
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
                  onPressed: () =>
                      onClickSignInWithEmailButton(context: context),
                ),
                const SizedBox(
                  height: 16,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterPage.routeName);
                  },
                  child: Text(
                    'アカウント登録はこちら',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
