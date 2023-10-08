import 'package:flutter/material.dart';

class TitleFormField extends StatelessWidget {
  const TitleFormField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      controller: controller,
      style: theme.textTheme.bodyMedium,
      textInputAction: TextInputAction.next, // return押下時の処理を変更できる.
      autofocus: true,
      decoration: const InputDecoration(
        label: Text('件名'),
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(borderSide: BorderSide.none),
        filled: true,
        hintText: '今日を一言で表現しましょう',
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'テキストを入力しましょう';
        }
        return null;
      },
    );
  }
}
