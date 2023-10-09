import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DescriptionFormField extends HookWidget {
  const DescriptionFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = useTextEditingController();

    return Expanded(
      child: TextFormField(
        controller: controller,
        style: theme.textTheme.bodyMedium,
        autofocus: true,
        expands: true,
        maxLines: null,
        textAlignVertical: TextAlignVertical.top,
        decoration: const InputDecoration(
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
