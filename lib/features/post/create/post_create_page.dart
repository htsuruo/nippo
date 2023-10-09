import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/features/post/post.dart';
import 'package:nippo/features/post/post_repository.dart';
import 'package:tsuruo_kit/tsuruo_kit.dart';

import 'description_form_field.dart';
import 'title_form_field.dart';

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
                        final documentRef = await ref
                            .read(progressController.notifier)
                            .executeWithProgress<DocumentReference<Post>>(
                              () => ref.read(postRepositoryProvider).create(
                                    post: Post(
                                      title: titleEditController.text,
                                      description:
                                          descriptionEditController.text,
                                    ),
                                  ),
                            );
                        if (documentRef.id.isNotEmpty) {
                          context.pop();
                        }
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
