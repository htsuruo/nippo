import 'package:flutter/material.dart';
import 'package:nippo/features/user/user_repository.dart';
import 'package:nippo/services/auth_repository.dart';

import '../base/base_page.dart';
import '../user/model/user.dart';
import 'email_form_field.dart';
import 'password_form_field.dart';
import 'submit_button.dart';

class SignInEmailPage extends StatelessWidget {
  SignInEmailPage({super.key});

  static const String routeName = '/signin_email';

  final _formKey = GlobalKey<FormState>();
  final _controller = <String, TextEditingController>{
    'email': TextEditingController(),
    'password': TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    Future<Map<String, Object>> submit() async {
      final email = _controller['email']!.text;
      final password = _controller['password']!.text;
      return AuthRepository().signInWithEmail(email: email, password: password);
    }

    Future<void> onSuccess({required User user}) async {
      await UserRepository().updateUser(user: user);
      await Navigator.pushReplacementNamed(context, BasePage.routeName);
      _controller['email']!.dispose();
      _controller['password']!.dispose();
      return;
    }

    void onFailed({required BuildContext context, required String errMessage}) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errMessage),
          backgroundColor: Colors.red,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('メールアドレスでログイン')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                EmailFormField(
                  controller: _controller['email']!,
                ),
                const SizedBox(height: 16),
                PasswordFormField(
                  controller: _controller['password']!,
                ),
                const SizedBox(height: 16),
                //SnackBar表示のためにcontextを生成.
                Builder(
                  builder: (context) {
                    return SubmitButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final map = await submit();
                          if (map['result'] as bool) {
                            await onSuccess(user: map['user'] as User);
                          } else {
                            final message = map['message'].toString();
                            onFailed(context: context, errMessage: message);
                          }
                        }
                      },
                      btnText: 'ログイン',
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
