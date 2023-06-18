import 'package:flutter/material.dart';
import 'package:nippo/theme.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<PasswordFormField> createState() =>
      _PasswordFormFieldState(controller: controller);
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  _PasswordFormFieldState({required this.controller});

  final TextEditingController controller;
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: VIC.navy,
            fontWeight: FontWeight.bold,
          ),
      cursorColor: VIC.navy,
      autofocus: true,
      controller: controller,
      decoration: InputDecoration(
        icon: const Icon(Icons.lock, size: 20, color: VIC.navy),
        contentPadding: const EdgeInsets.all(16),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: VIC.border),
          gapPadding: 0,
        ),
        hintText: 'パスワード',
        hintStyle: const TextStyle(fontWeight: FontWeight.normal),
        suffixIcon: IconButton(
          icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
        ),
      ),
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
