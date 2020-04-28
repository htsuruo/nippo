import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:nippo/constant.dart';
import 'package:provider/provider.dart';
import 'package:nippo/components/app_logo.dart';
import 'package:nippo/components/signin_sns_btn.dart';
import 'package:nippo/stores/progress_hub_store.dart';
import 'package:nippo/pages/home.dart';

class SignInPage extends StatelessWidget {
  static final String routeName = '/signin';
  static final double snsLogoHeight = 24;

  final _googleSignIn = GoogleSignIn();
  final _auth = FirebaseAuth.instance;

  Future<FirebaseUser> _handleGoogleSignIn() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    AuthResult result = await _auth.signInWithCredential(
        GoogleAuthProvider.getCredential(
            idToken: googleAuth.idToken, accessToken: googleAuth.accessToken));
    FirebaseUser user = result.user;
    print("sign in [ ${user.email} ], [ ${user.displayName} ]");
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
              Hero(
                child: AppLogo(height: 160),
                tag: 'appLogo',
              ),
              SizedBox(
                height: 80.0,
              ),
              SignInSnsBtn(
                logoImg: googleLogo,
                label: 'Sign in with Google',
                callback: () async {
                  try {
                    Provider.of<ProgressHUDStore>(context, listen: false)
                        .update(newState: true);
                    FirebaseUser user = await _handleGoogleSignIn();
                    print(user);
                    Navigator.pushReplacementNamed(context, HomePage.routeName,
                        arguments: 'from google.');
                  } catch (e) {
                    print(e);
                  }
                  Provider.of<ProgressHUDStore>(context, listen: false)
                      .update(newState: false);
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              SignInSnsBtn(
                logoImg: twitterLogo,
                label: 'Sign in with Twitter',
                callback: () async {
                  var result = await showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('確認'),
                          content: Text('Twitterログインは現在ご利用いただけません'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('OK'),
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
