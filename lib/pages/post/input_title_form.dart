import 'package:flutter/material.dart';
import 'package:nippo/theme.dart';

class InputTitleForm extends StatelessWidget {
  const InputTitleForm({@required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next, // return押下時の処理を変更できる.
      controller: controller,
      maxLines: 1,
      autofocus: true,
      cursorColor: VIC.red,
      style: const TextStyle(fontWeight: FontWeight.bold),
      decoration: const InputDecoration(
        hintText: '今日を一言で表現すると？',
        hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: VIC.red),
        ),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'テキストを入力しましょう';
        }
        return null;
      },
    );
  }
}
