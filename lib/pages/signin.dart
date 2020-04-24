import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nippo/app.dart';

class SignInPage extends StatelessWidget {
  static final String routeName = '/signin';

  Image appLogo = new Image(
    image: ExactAssetImage('assets/img/ic_main_logo.png'),
    height: 160.0,
    alignment: FractionalOffset.center,
  );

  Image GoogleLogo = new Image(
    image: ExactAssetImage('assets/img/ic_logo_google.png'),
    height: 24.0,
  );

  Image TwitterLogo = new Image(
    image: ExactAssetImage('assets/img/ic_logo_twitter.png'),
    height: 24.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            appLogo,
            SizedBox(
              height: 80.0,
            ),
            SignInBtn(
              logoImg: GoogleLogo,
              label: 'Sign in with Google',
              callback: () {
                Navigator.pushReplacementNamed(context, HomePage.routeName,
                    arguments: 'from google.');
              },
            ),
            SizedBox(
              height: 24.0,
            ),
            SignInBtn(
              logoImg: TwitterLogo,
              label: 'Sign in with Twitter',
              callback: () {
                Navigator.pushReplacementNamed(context, HomePage.routeName,
                    arguments: 'from twitter.');
              },
            ),
          ],
        ),
      ),
    ));
  }
}

class SignInBtn extends StatelessWidget {
  SignInBtn({@required this.logoImg, this.label, this.callback});

  final Image logoImg;
  final String label;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      color: Colors.white,
      borderSide: BorderSide(color: Color(0xFFDDDDDD)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      onPressed: this.callback,
      highlightColor: Colors.white,
      child: Container(
        width: 220,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            this.logoImg,
            SizedBox(
              width: 16,
            ),
            Text(
              this.label,
              style: GoogleFonts.roboto(
                  textStyle:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
