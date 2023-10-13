import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/common/common.dart';
import 'package:nippo/core/authentication/auth_repository.dart';
import 'package:nippo/logger.dart';
import 'package:tsuruo_kit/tsuruo_kit.dart';

class SigninPage extends ConsumerWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppLogo(),
            const Gap(44),
            ElevatedButton(
              onPressed: () async {
                try {
                  await ref
                      .read(progressController.notifier)
                      .executeWithProgress(
                        () =>
                            ref.read(authRepositoryProvider).signInWithGoogle(),
                      );
                } on Exception catch (e) {
                  logger.severe(e.toString());
                  await showOkAlertDialog(
                    context: context,
                    title: 'Google SignIn Failed',
                    message: e.toString(),
                  );
                }
              },
              child: const Text('Sign in with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
