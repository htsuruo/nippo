import 'package:flutter/material.dart';
import 'package:nippo/pages/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class CounterStore with ChangeNotifier {
  int count = 0;
  void increment() {
    count++;
    notifyListeners();
  }
}

class SettingPage extends StatelessWidget {
  static const String routeName = '/setting';
  final _auth = FirebaseAuth.instance;

  final List<String> items = ['hgoe', 'hgoe2', 'hgoe3'];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterStore(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '設定',
          ),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('ログアウト'),
                onPressed: () async {
                  await _auth.signOut();
                  print('logout successful.');
                  Navigator.pushNamedAndRemoveUntil(context,
                      SignInPage.routeName, (Route<dynamic> route) => false);
                },
              ),
              CounterText(),
              IncrementButton()
            ],
          ),
        ),
      ),
    );
  }
}

class IncrementButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterStore>(context, listen: false);
    return FlatButton(
      child: Text('incremnt'),
      onPressed: () {
        counter.increment();
      },
    );
  }
}

class CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterStore>(context);
    return Text('counter is ${counter.count}');
  }
}
