import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/common/common.dart';
import 'package:nippo/features/post/model/post.dart';
import 'package:nippo/features/post/post_repository.dart';
import 'package:tsuruo_kit/tsuruo_kit.dart';

import '../post_provider.dart';
import 'description_form_field.dart';
import 'title_form_field.dart';

class PostFormPage extends HookConsumerWidget {
  const PostFormPage._({this.postId});

  const PostFormPage.create() : this._();
  const PostFormPage.edit({required String postId}) : this._(postId: postId);

  final String? postId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO(htsuruo): 他デバイスからデータの更新があったときに入力途中でも破棄されて強制的に更新されてしまう問題。
    // `ref.listen`を使うようにコメントがあるが対象がAutoDisposeなProviderなので使えない。
    // ref. https://github.com/rrousselGit/riverpod/discussions/1069#discussioncomment-1919829
    final postSnap = ref.watch(postProvider(postId: postId)).value;
    final post = postSnap?.data();
    final isLoading = postId != null && postSnap == null;

    final formKey = useMemoized(GlobalKey<FormState>.new);
    final titleEditController = useTextEditingController(
      text: post?.title,
      keys: [post?.title],
    );
    final descriptionEditController = useTextEditingController(
      text: post?.description,
      keys: [post?.description],
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
                  _CancelButton(
                    post: post,
                    titleController: titleEditController,
                    descriptionController: descriptionEditController,
                  ),
                  const Spacer(),
                  if (!isLoading)
                    _SubmitButton(
                      formKey: formKey,
                      titleController: titleEditController,
                      descriptionController: descriptionEditController,
                      postSnap: postSnap,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: isLoading
            // TODO(htsuruo): 不自然なので1秒未満は非表示にする
            ? const CenteredCircularProgressIndicator()
            : Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TitleFormField(controller: titleEditController),
                    const Gap(12),
                    Expanded(
                      child: DescriptionFormField(
                        controller: descriptionEditController,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class _CancelButton extends StatelessWidget {
  const _CancelButton({
    required this.post,
    required this.titleController,
    required this.descriptionController,
  });

  final Post? post;
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        visualDensity: VisualDensity.compact,
      ),
      onPressed: () async {
        final skipConfirm = post ==
            post?.copyWith(
              title: titleController.text,
              description: descriptionController.text,
            );
        if (skipConfirm) {
          context.pop();
          return;
        }
        if (OkCancelResult.ok ==
            await showOkCancelAlertDialog(
              context: context,
              title: '確認',
              message: '変更内容は破棄されますがよろしいですか？',
            )) {
          context.pop();
        }
      },
      child: const Text('キャンセル'),
    );
  }
}

class _SubmitButton extends ConsumerWidget {
  const _SubmitButton({
    required this.formKey,
    required this.titleController,
    required this.descriptionController,
    this.postSnap,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final DocumentSnapshot<Post>? postSnap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      child: const Text('投稿する'),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          final title = titleController.text;
          final description = descriptionController.text;

          final postSnap = this.postSnap;
          if (postSnap == null) {
            ref
              ..read(postRepositoryProvider).create(
                post: Post(
                  title: title,
                  description: description,
                ),
              )
              ..read(scaffoldMessengerKey).currentState!.showMessage(
                    '[$title]を投稿しました',
                  );
          } else {
            ref.read(postRepositoryProvider).update(
                  reference: postSnap.reference,
                  post: postSnap.data()!.copyWith(
                        title: title,
                        description: description,
                      ),
                );
          }
          context.pop();
        }
      },
    );
  }
}
