import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TitleFormField extends HookWidget {
  const TitleFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = useTextEditingController();

    return TextFormField(
      controller: controller,
      style: theme.textTheme.bodyMedium,
      textInputAction: TextInputAction.next,
      autofocus: true,
      decoration: const InputDecoration(
        label: Text('件名'),
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
