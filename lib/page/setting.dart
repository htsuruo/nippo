import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  static const String routeName = '/setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('設定'),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
        ),
      ),
    );
  }
}
