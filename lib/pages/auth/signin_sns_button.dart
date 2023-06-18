import 'package:flutter/material.dart';
import 'package:nippo/theme.dart';

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
    return OutlineButton(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      color: Colors.white,
      borderSide: const BorderSide(color: VIC.border),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      onPressed: onPressed,
      highlightColor: Colors.white,
      child: SizedBox(
        width: 220,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            logoImg,
            const SizedBox(
              width: 16,
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}
