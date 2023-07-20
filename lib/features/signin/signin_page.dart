import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/authenticator.dart';
import 'package:nippo/gen/assets.gen.dart';

class SigninPage extends ConsumerWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.icons.nippo.svg(
              width: 180,
            ),
            const Gap(80),
            GoogleAuthButton(
              onPressed: () {
                ref.read(authenticatorProvider.notifier).signInWithGoogle();
              },
              style: const AuthButtonStyle(
                buttonType: AuthButtonType.secondary,
              ),
            ),
            const Gap(20),
            AppleAuthButton(
              onPressed: () {},
              style: const AuthButtonStyle(
                buttonType: AuthButtonType.secondary,
              ),
            ),
            // `firebase_ui_auth`でGoogleやAppleなどのOAuth認証がどうもできなさそうなので微妙
            // Expanded(
            //   child: SignInScreen(
            //     providers: [
            //       EmailAuthProvider(),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
