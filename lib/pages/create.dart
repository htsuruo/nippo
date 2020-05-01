import 'package:flutter/material.dart';

class CreatePage extends StatelessWidget {
  static const String routeName = '/create';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新しい日報を書く'),
        backgroundColor: const Color(0xFFE84855),
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(
            title: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
