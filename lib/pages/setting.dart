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

  final List<Widget> widgetItems = [
    ListTile(
      title: Text(
        'アカウント情報',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      dense: true,
    ),
    ListTile(
      title: Text('最終ログイン日時'),
    ),
    ListTile(
      title: Text('認証プロバイダ'),
    ),
    SizedBox(
      height: 20.0,
    ),
    ListTile(
      title: Text(
        'サービスについて',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      dense: true,
    ),
    ListTile(
      title: Text('利用規約'),
    ),
    ListTile(
      title: Text('プライバシーポリシー'),
    ),
    ListTile(
      title: Text('運営会社'),
    ),
    SizedBox(
      height: 40.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '設定',
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.red[50],
              child: ListTile(
                title: Center(
                  child: Text(
                    'ログアウト',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                onTap: () async {
                  await _auth.signOut();
                  print('logout successful.');
                  Navigator.pushNamedAndRemoveUntil(context,
                      SignInPage.routeName, (Route<dynamic> route) => false);
                },
              ),
            ),
//              CounterText(),
//              IncrementButton()
          ],
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
