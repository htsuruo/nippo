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

void signOut(context) async {
  final _auth = FirebaseAuth.instance;
  await _auth.signOut();
  print('logout successful.');
  Navigator.pushNamedAndRemoveUntil(
      context, SignInPage.routeName, (Route<dynamic> route) => false);
}

class SettingPage extends StatelessWidget {
  static const String routeName = '/setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '設定',
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Color(0xFF0F0F0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 48, left: 16, right: 16, bottom: 8),
                child: Text(
                  'アカウント情報について',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(height: 0.5, color: Colors.black26),
              Container(
                child: ListTile(
                  title: Text('認証プロバイダ'),
                  trailing: Text('Google'),
                ),
              ),
              const Divider(indent: 16, height: 0.5, color: Colors.black26),
              Container(
                child: ListTile(
                  title: Text('最終ログイン日時'),
                  trailing: Text('2020.04.30'),
                ),
              ),
              const Divider(height: 0.5, color: Colors.black26),
              Padding(
                padding: const EdgeInsets.only(
                    top: 48, left: 16, right: 16, bottom: 8),
                child: Text(
                  'サービスについて',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(height: 0.5, color: Colors.black26),
              Container(
                child: ListTile(
                  title: Text('利用規約'),
                  trailing: Icon(Icons.navigate_next),
                  onTap: () {},
                ),
              ),
              const Divider(indent: 16, height: 0.5, color: Colors.black26),
              Container(
                child: ListTile(
                  title: Text('プライバシーポリシー'),
                  trailing: Icon(Icons.navigate_next),
                  onTap: () {},
                ),
              ),
              const Divider(indent: 16, height: 0.5, color: Colors.black26),
              Container(
                child: ListTile(
                  title: Text('運営会社'),
                  trailing: Icon(Icons.open_in_new),
                  onTap: () {},
                ),
              ),
              const Divider(indent: 16, height: 0.5, color: Colors.black26),
              Container(
                child: ListTile(
                  title: Text('バージョン'),
                  trailing: Text('1.0.0'),
                ),
              ),
              const Divider(height: 0.5, color: Colors.black26),
              SizedBox(
                height: 32,
              ),
              Container(
                color: Colors.red[50],
                child: Container(
                  alignment: Alignment.center,
                  child: ListTile(
                    title: Center(
                      child: Text('ログアウト',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold)),
                    ),
                    onTap: () => signOut(context),
                  ),
                ),
              ),
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
