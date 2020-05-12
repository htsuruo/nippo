import 'package:flutter/material.dart';
import 'package:nippo/models/user.dart';
import 'package:nippo/pages/home.dart';
import 'package:nippo/repositories/auth_repository.dart';
import 'package:nippo/repositories/user_repository.dart';
import 'package:nippo/states/user_state.dart';
import 'package:nippo/theme.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  static const String routeName = '/register';

  @override
  Widget build(BuildContext context) {
    final _controller = <String, TextEditingController>{
      'email': TextEditingController(),
      'password': TextEditingController(),
    };
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(title: const Text('メールアドレスの登録')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                LoginFormField(
                  controller: _controller['email'],
                ),
                const SizedBox(height: 16),
                PasswordFormField(
                  controller: _controller['password'],
                ),
                const SizedBox(height: 16),
                SubmitBtn(formKey: _formKey, controller: _controller)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginFormField extends StatelessWidget {
  LoginFormField({@required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style:
          TextStyle(color: VIC.navy, fontSize: 15, fontWeight: FontWeight.bold),
      cursorColor: VIC.navy,
      autofocus: true,
      controller: controller,
      decoration: InputDecoration(
        icon: Icon(Icons.email, size: 20, color: VIC.navy),
        contentPadding: const EdgeInsets.all(16),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: VIC.border),
          gapPadding: 0,
        ),
        hintText: 'メールアドレス',
        hintStyle: TextStyle(fontWeight: FontWeight.normal),
      ),
      validator: (value) {
        print(value);
        if (value.isEmpty) {
          return 'メールアドレスを入力しましょう';
        }
        if (!EmailValidator.validate(value)) {
          return '正しく入力して下さい';
        }
        return null;
      },
    );
  }
}

class PasswordFormField extends StatefulWidget {
  PasswordFormField({@required this.controller});

  final TextEditingController controller;

  @override
  _PasswordFormFieldState createState() =>
      _PasswordFormFieldState(controller: controller);
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  _PasswordFormFieldState({@required this.controller});

  final TextEditingController controller;
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      style:
          TextStyle(color: VIC.navy, fontSize: 15, fontWeight: FontWeight.bold),
      cursorColor: VIC.navy,
      autofocus: true,
      controller: controller,
      decoration: InputDecoration(
          icon: Icon(Icons.lock, size: 20, color: VIC.navy),
          contentPadding: const EdgeInsets.all(16),
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: VIC.border),
            gapPadding: 0,
          ),
          hintText: 'パスワード',
          hintStyle: TextStyle(fontWeight: FontWeight.normal),
          suffixIcon: IconButton(
            icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
          )),
      validator: (value) {
        if (value.isEmpty) {
          return 'パスワードを入力しましょう';
        }
        if (value.length < 8) {
          return '8文字以上必要です';
        }
        return null;
      },
    );
  }
}

class SubmitBtn extends StatelessWidget {
  const SubmitBtn({
    @required this.formKey,
    @required this.controller,
  });

  final GlobalKey<FormState> formKey;
  final Map<String, TextEditingController> controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: VIC.navy,
        child: Text('アカウント登録',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        onPressed: () async {
          if (formKey.currentState.validate()) {
            final map = await submit(controller, context);
            if (map['result'] as bool) {
              final tmpUser = map['user'] as User;
              final user = User(
                  uid: tmpUser.uid,
                  email: tmpUser.email,
                  providerData: tmpUser.providerData,
                  lastSignInTime: tmpUser.lastSignInTime);
              await UserRepository().createUser(user: user);
              Provider.of<UserController>(context, listen: false)
                  .updateData(user: user);
              await Navigator.pushReplacementNamed(context, HomePage.routeName);
              controller['email'].dispose();
              controller['password'].dispose();
              return;
            }
            print(map['result']);
            print('error is ${map['message']}');
          }
        },
      ),
    );
  }
}

Future<Map<String, Object>> submit(
    Map<String, TextEditingController> controller, BuildContext context) async {
  final email = controller['email'].text;
  final password = controller['password'].text;
  print('value: $email, $password');
  return Auth().signUpWithEmail(email: email, password: password);
}
