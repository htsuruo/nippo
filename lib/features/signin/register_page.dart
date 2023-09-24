import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:nippo/core/auth_repository.dart';
import 'package:nippo/features/user/user_repository.dart';
import 'package:nippo/states/progress_hub_controller.dart';
import 'package:provider/provider.dart';

import '../base/base_page.dart';
import '../user/model/user.dart';
import 'email_form_field.dart';
import 'password_form_field.dart';
import 'submit_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage._();
  static const String routeName = '/register';

  static Widget wrapped() {
    return StateNotifierProvider<ProgressHUDController, bool>(
      create: (context) => ProgressHUDController(),
      builder: (context, child) => const RegisterPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = <String, TextEditingController>{
      'email': TextEditingController(),
      'password': TextEditingController(),
    };
    final formKey = GlobalKey<FormState>();

    Future<Map<String, Object>> submit() async {
      final email = controller['email']!.text;
      final password = controller['password']!.text;
      return AuthRepository().signUpWithEmail(email: email, password: password);
    }

    Future<void> onSuccess({required User tmpUser}) async {
      final user = User(
        uid: tmpUser.uid,
        email: tmpUser.email,
        providerData: tmpUser.providerData,
        lastSignInTime: tmpUser.lastSignInTime,
      );
      await UserRepository().updateUser(user: user);
      await Navigator.pushReplacementNamed(context, BasePage.routeName);
      controller['email']!.dispose();
      controller['password']!.dispose();
    }

    void onFailed({required BuildContext context, required String errMessage}) {
      ScaffoldMessenger.of(context).showSnackBar(
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
              key: formKey,
              child: Column(
                children: <Widget>[
                  EmailFormField(
                    controller: controller['email']!,
                  ),
                  const SizedBox(height: 16),
                  PasswordFormField(
                    controller: controller['password']!,
                  ),
                  const SizedBox(height: 16),
                  //SnackBar表示のためにcontextを生成.
                  Builder(
                    builder: (context) {
                      return SubmitButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            final map = await submit();
                            if (map['result']! as bool) {
                              await onSuccess(tmpUser: map['user']! as User);
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
