import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:nippo/components/app_logo.dart';
import 'package:nippo/components/signin_sns_btn.dart';
import 'package:nippo/constant.dart';
import 'package:nippo/pages/home.dart';
import 'package:nippo/stores/progress_hub_store.dart';
import 'package:provider/provider.dart';

@immutable
// ignore: must_be_immutable
class SignInPage extends StatelessWidget {
  static const String routeName = '/signin';
  static const double snsLogoHeight = 24;

  final _googleSignIn = GoogleSignIn();
  final _auth = FirebaseAuth.instance;

  Future<FirebaseUser> _handleGoogleSignIn() async {
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser.authentication;
    final result = await _auth.signInWithCredential(
        GoogleAuthProvider.getCredential(
            idToken: googleAuth.idToken, accessToken: googleAuth.accessToken));
    final user = result.user;
    print('sign in [ ${user.email} ], [ ${user.displayName} ]');
    return user;
  }

  Image googleLogo = Image(
    image: ExactAssetImage(AssetPath.GOOGLE_LOGO_PATH),
    height: snsLogoHeight,
  );

  Image twitterLogo = Image(
    image: ExactAssetImage(AssetPath.TW_LOGO_PATH),
    height: snsLogoHeight,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ModalProgressHUD(
      inAsyncCall: Provider.of<ProgressHUDStore>(context).saving,
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Hero(
                child: AppLogo(height: 160),
                tag: 'appLogo',
              ),
              const SizedBox(
                height: 80,
              ),
              SignInSnsBtn(
                logoImg: googleLogo,
                label: 'Sign in with Google',
                callback: () async {
                  try {
                    Provider.of<ProgressHUDStore>(context, listen: false)
                        .update(newState: true);
                    final user = await _handleGoogleSignIn();
                    print(user);
                    await Navigator.pushReplacementNamed(
                        context, HomePage.routeName,
                        arguments: 'from google.');
                  } on Exception catch (e) {
                    print(e);
                  }
                  Provider.of<ProgressHUDStore>(context, listen: false)
                      .update(newState: false);
                },
              ),
              const SizedBox(
                height: 24,
              ),
              SignInSnsBtn(
                logoImg: twitterLogo,
                label: 'Sign in with Twitter',
                callback: () async {
                  final result = await showDialog<AlertDialog>(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('確認'),
                          content: const Text('Twitterログインは現在ご利用いただけません'),
                          actions: <Widget>[
                            FlatButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop(0);
                              },
                            )
                          ],
                        );
                      });
                  print('dialog result is $result');
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
