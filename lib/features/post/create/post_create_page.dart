import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'description_form_field.dart';
import 'title_form_field.dart';

class PostCreatePage extends HookConsumerWidget {
  const PostCreatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey<FormState>.new);

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
                    onPressed: () {
                      // TODO(tsuruoka): 保存処理
                      if (formKey.currentState!.validate()) {}
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
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TitleFormField(),
              Gap(16),
              DescriptionFormField(),
            ],
          ),
        ),
      ),
    );
  }
}


// class SubmitButton extends StatelessWidget {
//   const SubmitButton({
//     super.key,
//     required this.formKey,
//     required this.controller,
//   });

//   final GlobalKey<FormState> formKey;
//   final Map<String, TextEditingController> controller;

//   @override
//   Widget build(BuildContext context) {
//     // final uid = context.select((AuthState s) => s.user.uid);
//     const uid = '';
//     return OutlinedButton(
//       style: OutlinedButton.styleFrom(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
//         foregroundColor: VIC.red,
//       ),
//       onPressed: () async {
//         if (formKey.currentState!.validate()) {
//           // final progressController = context.read<ProgressHUDController>()
//           //   ..update(newState: true);
//           final post = Post(
//             title: controller['title']!.text,
//             description: controller['description']!.text,
//           );
//           await context.read<PostController>().create(post: post, uid: uid);
//           Navigator.pop(context);
//           // progressController.update(newState: false);
// //          controller['title'].dispose();
// //          controller['description'].dispose();
//         }
//       },
//       child: const Padding(
//         padding: EdgeInsets.symmetric(horizontal: 16),
//         child: Text(
//           '投稿する',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 14,
//           ),
//         ),
//       ),
//     );
//   }
// }
