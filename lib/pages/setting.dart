import 'package:flutter/material.dart';
import 'package:nippo/pages/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingPage extends StatelessWidget {
  static const String routeName = '/setting';
  final _auth = FirebaseAuth.instance;

  List<String> items = ['hgoe', 'hgoe2', 'hgoe3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('設定'),
      ),
      body: SafeArea(
        child: RaisedButton(
          child: Text('ログアウト'),
          onPressed: () async {
            await _auth.signOut();
            print('logout successful.');
            Navigator.pushNamedAndRemoveUntil(
                context, SignInPage.routeName, (Route<dynamic> route) => false);
          },
        ),
      ),
    );
  }
}
