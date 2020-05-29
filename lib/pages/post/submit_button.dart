import 'package:flutter/material.dart';
import 'package:nippo/models/controllers/auth/auth_state.dart';
import 'package:nippo/models/controllers/post/post_controller.dart';
import 'package:nippo/models/entities/post.dart';
import 'package:nippo/states/progress_hub_controller.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({@required this.formKey, @required this.controller});

  final GlobalKey<FormState> formKey;
  final Map<String, TextEditingController> controller;

  @override
  Widget build(BuildContext context) {
    final uid = context.select((AuthState s) => s.user.uid);
    return FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      color: VIC.red,
      onPressed: () async {
        if (formKey.currentState.validate()) {
          final _progressController = context.read<ProgressHUDController>()
            ..update(newState: true);
          final post = Post(
            title: controller['title'].text,
            description: controller['description'].text,
          );
          await context.read<PostController>().create(post: post, uid: uid);
          Navigator.pop(context);
          _progressController.update(newState: false);
//          controller['title'].dispose();
//          controller['description'].dispose();
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          '投稿する',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    );
  }
}
