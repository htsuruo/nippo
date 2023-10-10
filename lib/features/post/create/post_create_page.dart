import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/features/post/post_repository.dart';
import 'package:tsuruo_kit/tsuruo_kit.dart';

import 'widgets/description_form_field.dart';
import 'widgets/title_form_field.dart';

class PostCreatePage extends HookConsumerWidget {
  const PostCreatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final titleEditController = useTextEditingController();
    final descriptionEditController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        actions: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      visualDensity: VisualDensity.compact,
                    ),
                    onPressed: () async {
                      final res = await showOkCancelAlertDialog(
                        context: context,
                        title: '確認',
                        message: '入力内容は破棄されますがよろしいですか？',
                      );
                      if (res == OkCancelResult.ok) {
                        context.pop();
                      }
                    },
                    child: const Text('キャンセル'),
                  ),
                  const Spacer(),
                  FilledButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await ref
                            .read(progressController.notifier)
                            .executeWithProgress<void>(
                              () => ref.read(postRepositoryProvider).create(
                                    title: titleEditController.text,
                                    description: descriptionEditController.text,
                                  ),
                            );

                        // REVIEW(htsuruo): addではなくsetになるためvoidになり判定できないため、
                        // 問答無用でpopするしかない。ちなみにvoidがsetとなっているのは、
                        // オフライン同期されるので遅かれ早かれsetで失敗するケースは無いという理解でよいのだろうか。
                        context.pop();
                      }
                    },
                    child: const Text('投稿する'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TitleFormField(controller: titleEditController),
              const Gap(12),
              DescriptionFormField(controller: descriptionEditController),
            ],
          ),
        ),
      ),
    );
  }
}
