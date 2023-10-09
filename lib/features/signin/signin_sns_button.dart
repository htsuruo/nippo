import 'package:flutter/material.dart';

class SignInSnsButton extends StatelessWidget {
  const SignInSnsButton({
    super.key,
    required this.logoImg,
    required this.label,
    required this.onPressed,
  });

  final Image logoImg;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: SizedBox(
        width: 220,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            logoImg,
            const SizedBox(
              width: 16,
            ),
            Text(
              label,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
