import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/features/post/model/post.dart';
import 'package:nippo/features/post/post_provider.dart';
import 'package:nippo/features/post/post_repository.dart';
import 'package:tsuruo_kit/tsuruo_kit.dart';

import 'widgets/description_form_field.dart';
import 'widgets/title_form_field.dart';

class PostFormPage extends HookConsumerWidget {
  const PostFormPage._({this.postId});

  const PostFormPage.create() : this._();
  const PostFormPage.edit({required String postId}) : this._(postId: postId);

  final String? postId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final post = ref.watch(postProvider(postId)).value?.data();
    final titleEditController = useTextEditingController(text: post?.title);
    final descriptionEditController = useTextEditingController(
      text: post?.description,
    );

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
                  _SaveButton(
                    formKey: formKey,
                    titleEditingController: titleEditController,
                    descriptionEditingController: descriptionEditController,
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

class _SaveButton extends ConsumerWidget {
  const _SaveButton({
    required this.formKey,
    required this.titleEditingController,
    required this.descriptionEditingController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController titleEditingController;
  final TextEditingController descriptionEditingController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      child: const Text('投稿する'),
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          final title = titleEditingController.text;
          await ref.read(postRepositoryProvider).create(
                post: Post(
                  title: title,
                  description: descriptionEditingController.text,
                ),
              );
          ref.read(scaffoldMessengerKey).currentState!.showMessage(
                '[$title]を投稿しました',
              );
          context.pop();
        }
      },
    );
  }
}
