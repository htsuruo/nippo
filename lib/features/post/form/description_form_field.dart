import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'form_validator.dart';

class DescriptionFormField extends HookWidget {
  const DescriptionFormField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: controller,
      style: theme.textTheme.bodyMedium,
      autofocus: true,
      expands: true,
      maxLines: null,
      textAlignVertical: TextAlignVertical.top,
      decoration: const InputDecoration(
        hintText: '今日起きたたくさんの出来事を記録しましょう',
      ),
      validator: FormValidator.validateDescription,
    );
  }
}
