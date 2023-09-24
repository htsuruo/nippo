import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/auth_controller.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AuthController>();
    return Container(
      color: Colors.red[50],
      child: Container(
        alignment: Alignment.center,
        child: ListTile(
          title: const Center(
            child: Text('サインアウト', style: TextStyle(color: Colors.red)),
          ),
          onTap: () async {
            await controller.signOut();
            // await Navigator.pushNamedAndRemoveUntil(
            //   context,
            //   SignInPage.routeName,
            //   (Route<dynamic> route) => false,
            // );
          },
        ),
      ),
    );
  }
}
