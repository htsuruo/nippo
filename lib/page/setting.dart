import 'package:flutter/material.dart';
import 'package:nippo/page/signin.dart';

class SettingPage extends StatelessWidget {
  static const String routeName = '/setting';

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
          onPressed: () {
            print('ログアウト');
            Navigator.popUntil(
                context, ModalRoute.withName(SignInPage.routeName));
          },
        ),
      ),
    );
  }
}
