import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  static final String routeName = '/user';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登録者'),
      ),
      body: Text('ユーザー一覧ページです'),
    );
  }
}
