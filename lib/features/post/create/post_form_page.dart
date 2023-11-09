import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/common/common.dart';
import 'package:nippo/features/post/create/post_form_controller.dart';
import 'package:nippo/features/post/model/post.dart';
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
    final controller = ref.watch(postFormControllerProvider(postId: postId));
    final formState = controller.value;

    final formKey = useMemoized(GlobalKey<FormState>.new);
    final titleEditController = useTextEditingController(
      text: formState?.title,
      keys: [formState?.title],
    );
    final descriptionEditController = useTextEditingController(
      text: formState?.description,
      keys: [formState?.description],
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
                      if (OkCancelResult.ok ==
                          await showOkCancelAlertDialog(
                            context: context,
                            title: '確認',
                            message: '入力内容は破棄されますがよろしいですか？',
                          )) {
                        context.pop();
                      }
                    },
                    child: const Text('キャンセル'),
                  ),
                  const Spacer(),
                  _SubmitButton(
                    formKey: formKey,
                    titleEditingController: titleEditController,
                    descriptionEditingController: descriptionEditController,
                    postRef: formState?.postRef,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: controller.isLoading
            // TODO(htsuruo): 不自然なので1秒未満は非表示にする
            ? const CenteredCircularProgressIndicator()
            : Form(
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

class _SubmitButton extends ConsumerWidget {
  const _SubmitButton({
    required this.formKey,
    required this.titleEditingController,
    required this.descriptionEditingController,
    this.postRef,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController titleEditingController;
  final TextEditingController descriptionEditingController;
  final DocumentReference<Post>? postRef;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      child: const Text('投稿する'),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          final title = titleEditingController.text;
          final description = descriptionEditingController.text;

          final postRef = this.postRef;
          if (postRef == null) {
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
            // TODO(htsuruo): 要修正
            // ref.read(postRepositoryProvider).update(
            //       reference: postSnap.reference,
            //       post: postSnap.data()!.copyWith(
            //             title: title,
            //             description: description,
            //           ),
            //     );
          }

          context.pop();
        }
      },
    );
  }
}
