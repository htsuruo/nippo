import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'form_validator.dart';

class TitleFormField extends HookWidget {
  const TitleFormField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: controller,
      style: theme.textTheme.bodyMedium,
      textInputAction: TextInputAction.next,
      autofocus: true,
      decoration: const InputDecoration(
        label: Text('件名'),
        hintText: '今日を一言で表現しましょう',
      ),
      validator: FormValidator.validateTitle,
    );
  }
}
