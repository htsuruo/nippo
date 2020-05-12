import 'package:flutter/material.dart';

class SignInEmailPage extends StatelessWidget {
  static const String routeName = '/signin_email';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('メールアドレスでサインイン')),
      body: SafeArea(
        child: Text('gge'),
      ),
    );
  }
}
