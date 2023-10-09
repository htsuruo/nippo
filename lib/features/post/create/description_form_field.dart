import 'package:flutter/material.dart';

class DescriptionFormField extends StatelessWidget {
  const DescriptionFormField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: TextFormField(
        controller: controller,
        style: theme.textTheme.bodyMedium,
        autofocus: true,
        expands: true,
        maxLines: null,
        textAlignVertical: TextAlignVertical.top,
        decoration: const InputDecoration(
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(borderSide: BorderSide.none),
          contentPadding: EdgeInsets.all(12),
          alignLabelWithHint: true,
          hintText: '今日起きたたくさんの出来事を記録しましょう',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'テキストを入力しましょう';
          }
          return null;
        },
      ),
    );
  }
}
