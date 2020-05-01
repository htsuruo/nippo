import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatelessWidget {
  static const String routeName = '/create';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton(
              child: const Text(
                'キャンセル',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            SubmitBtn(formKey: _formKey),
          ],
        ),
        automaticallyImplyLeading: false,
        titleSpacing: 16,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
              child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                InputTitleForm(),
                const SizedBox(height: 16),
                InputDescriptionForm(),
              ],
            ),
          )),
        ),
      ),
    );
  }
}

class InputTitleForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      autofocus: true,
      cursorColor: const Color(0xFFE84855),
      style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
      decoration: const InputDecoration(
        icon: Icon(Icons.message, color: Color(0xFFE84855)),
        hintText: '今日を一言で表現すると？',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE84855)),
        ),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'テキストを入力しましょう';
        }
        return null;
      },
    );
  }
}

class InputDescriptionForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
      maxLines: 8,
      autofocus: true,
      cursorColor: const Color(0xFFE84855),
      decoration: const InputDecoration(
        filled: true,
        border: InputBorder.none,
        alignLabelWithHint: true,
        hintText: '今日起きたたくさんの出来事を記録しましょう',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'テキストを入力しましょう';
        }
        return null;
      },
    );
  }
}

class SubmitBtn extends StatelessWidget {
  const SubmitBtn({@required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      color: const Color(0xFFE84855),
      onPressed: () {
        if (formKey.currentState.validate()) {
          print('success');
          Navigator.pop(context);
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
