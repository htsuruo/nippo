import 'package:flutter/material.dart';
import 'package:nippo/theme.dart';

class InputDescriptionForm extends StatelessWidget {
  const InputDescriptionForm({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      controller: controller,
      style: const TextStyle(fontWeight: FontWeight.bold),
      maxLines: 8,
      autofocus: true,
      cursorColor: VIC.red,
      decoration: const InputDecoration(
        filled: true,
        border: InputBorder.none,
        alignLabelWithHint: true,
        hintText: '今日起きたたくさんの出来事を記録しましょう',
        hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
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
