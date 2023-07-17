import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:nippo/gen/assets.gen.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.images.icons.nippo.svg(
            width: 160,
          ),
          Expanded(
            child: SignInScreen(
              providers: [
                EmailAuthProvider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
