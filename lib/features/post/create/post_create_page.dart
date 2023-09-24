import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import 'input_description_form.dart';
import 'input_title_form.dart';
import 'submit_button.dart';

class PostCreatePage extends StatelessWidget {
  PostCreatePage._();
  static const String routeName = '/create';

  final _formKey = GlobalKey<FormState>();
  final _formController = {
    'title': TextEditingController(),
    'description': TextEditingController(),
  };

  // static Widget wrapped() {
  //   return StateNotifierProvider<ProgressHUDController, bool>(
  //     create: (context) => ProgressHUDController(),
  //     builder: (context, child) => PostCreatePage._(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: context.select((bool s) => s),
      child: Scaffold(
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
              SubmitButton(formKey: _formKey, controller: _formController),
            ],
          ),
          automaticallyImplyLeading: false,
          titleSpacing: 16,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  InputTitleForm(controller: _formController['title']!),
                  const SizedBox(height: 16),
                  InputDescriptionForm(
                    controller: _formController['description']!,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
