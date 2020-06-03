import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:nippo/models/entities/user.dart';
import 'package:nippo/models/repositories/auth_repository.dart';
import 'package:nippo/models/repositories/user_repository.dart';
import 'package:nippo/pages/auth/email_form_field.dart';
import 'package:nippo/pages/auth/password_form_field.dart';
import 'package:nippo/pages/auth/submit_button.dart';
import 'package:nippo/pages/base_page.dart';
import 'package:nippo/states/progress_hub_controller.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage._({Key key}) : super(key: key);
  static const String routeName = '/register';

  static Widget wrapped() {
    return StateNotifierProvider<ProgressHUDController, bool>(
      create: (context) => ProgressHUDController(),
      builder: (context, _child) => const RegisterPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _controller = <String, TextEditingController>{
      'email': TextEditingController(),
      'password': TextEditingController(),
    };
    final _formKey = GlobalKey<FormState>();

    Future<Map<String, Object>> submit() async {
      final email = _controller['email'].text;
      final password = _controller['password'].text;
      return AuthRepository().signUpWithEmail(email: email, password: password);
    }

    Future<void> onSuccess({User tmpUser}) async {
      final user = User(
          uid: tmpUser.uid,
          email: tmpUser.email,
          providerData: tmpUser.providerData,
          lastSignInTime: tmpUser.lastSignInTime);
      await UserRepository().updateUser(user: user);
      await Navigator.pushReplacementNamed(context, BasePage.routeName);
      _controller['email'].dispose();
      _controller['password'].dispose();
    }

    void onFailed({BuildContext context, String errMessage}) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(errMessage),
          backgroundColor: Colors.red,
        ),
      );
    }

    return ModalProgressHUD(
      inAsyncCall: context.select((bool saving) => saving),
      child: Scaffold(
        appBar: AppBar(title: const Text('メールアドレスで登録')),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  EmailFormField(
                    controller: _controller['email'],
                  ),
                  const SizedBox(height: 16),
                  PasswordFormField(
                    controller: _controller['password'],
                  ),
                  const SizedBox(height: 16),
                  //SnackBar表示のためにcontextを生成.
                  Builder(
                    builder: (context) {
                      return SubmitButton(
                        onPressed: () async {
                          // TODO(tsuru):ここにProguressHUBを表示したいが「At this point the state of the widget's element tree is no longer stable.」との警告が解決できない
//                          final controller = context
//                              .read<ProgressHUDController>()
//                                ..update(newState: true);
                          if (_formKey.currentState.validate()) {
                            final map = await submit();
                            if (map['result'] as bool) {
                              await onSuccess(tmpUser: map['user'] as User);
                            } else {
                              final message = map['message'].toString();
                              onFailed(context: context, errMessage: message);
                            }
                          }
//                          controller.update(newState: false);
                        },
                        btnText: 'アカウント登録',
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
