import 'package:flutter/material.dart';
import 'package:nippo/theme.dart';

class RegisterPage extends StatelessWidget {
  static const String routeName = '/register';

  @override
  Widget build(BuildContext context) {
    final controller = <String, TextEditingController>{
      'email': TextEditingController(),
      'password': TextEditingController(),
    };

    return Scaffold(
      appBar: AppBar(title: const Text('メールアドレスの登録')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
          child: Column(
            children: <Widget>[
              LoginFormField(
                  controller: controller['email'],
                  hintText: 'メールアドレス',
                  keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 24),
              LoginFormField(
                  controller: controller['password'], hintText: 'パスワード'),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  color: VIC.navy,
                  child: Text('アカウント登録',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  onPressed: () {
                    print(
                        'value: ${controller['email'].text}, ${controller['password'].text}');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginFormField extends StatelessWidget {
  const LoginFormField(
      {@required this.controller, this.hintText, this.keyboardType});

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: VIC.navy),
      cursorColor: VIC.navy,
      autofocus: true,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: VIC.border),
          gapPadding: 0,
        ),
        hintText: hintText,
      ),
    );
  }
}
