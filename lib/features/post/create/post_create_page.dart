import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'description_form_field.dart';
import 'title_form_field.dart';

class PostCreatePage extends StatelessWidget {
  const PostCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final formController = {
      'title': TextEditingController(),
      'description': TextEditingController(),
    };
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
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: context.pop,
                    child: const Text('キャンセル'),
                  ),
                  const Spacer(),
                  FilledButton(
                    onPressed: () {
                      // TODO(tsuruoka): 保存処理
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
            children: <Widget>[
              TitleFormField(controller: formController['title']!),
              const SizedBox(height: 16),
              DescriptionFormField(
                controller: formController['description']!,
              ),
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
