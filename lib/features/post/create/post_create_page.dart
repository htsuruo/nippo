import 'package:flutter/material.dart';

import 'input_description_form.dart';
import 'input_title_form.dart';
import 'submit_button.dart';

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: const Text('キャンセル'),
              onPressed: () => Navigator.pop(context),
            ),
            SubmitButton(formKey: formKey, controller: formController),
          ],
        ),
        automaticallyImplyLeading: false,
        titleSpacing: 16,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                InputTitleForm(controller: formController['title']!),
                const SizedBox(height: 16),
                InputDescriptionForm(
                  controller: formController['description']!,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
