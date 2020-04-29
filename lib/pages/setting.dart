import 'package:flutter/material.dart';
import 'package:nippo/components/simple_list_container.dart';
import 'package:nippo/components/simple_list_section.dart';
import 'package:nippo/pages/signin.dart';
import 'package:nippo/services/auth.dart';

class SettingPage extends StatelessWidget {
  static const String routeName = '/setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '設定',
        ),
      ),
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              ...firstSection(),
              ...secondSection(),
              const SizedBox(
                height: 32,
              ),
              SignOutBtn(),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> firstSection() {
  const children = [
    SimpleListSection(title: 'ログイン情報'),
    Divider(),
    SimpleListContainer(
      title: '認証プロバイダ',
      trailing: Text('Google'),
    ),
    Divider(indent: 16),
    SimpleListContainer(
      title: '最終ログイン日時',
      trailing: Text('2020.04.30'),
    ),
    Divider(),
  ];
  return children;
}

List<Widget> secondSection() {
  final children = [
    const SimpleListSection(title: 'サービスについて'),
    const Divider(),
    SimpleListContainer(
      title: '利用規約',
      trailing: Icon(Icons.navigate_next),
      onTap: () {},
    ),
    const Divider(indent: 16),
    SimpleListContainer(
      title: 'プライバシーポリシー',
      trailing: Icon(Icons.navigate_next),
      onTap: () {},
    ),
    const Divider(indent: 16),
    SimpleListContainer(
      title: '運営会社',
      trailing: Icon(Icons.open_in_new),
      onTap: () {},
    ),
    const Divider(indent: 16),
    const SimpleListContainer(
      title: 'バージョン',
      trailing: Text('1.0.0'),
    ),
    const Divider(),
  ];
  return children;
}

class SignOutBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[50],
      child: Container(
        alignment: Alignment.center,
        child: ListTile(
          title: Center(
            child: Text('サインアウト', style: TextStyle(color: Colors.red)),
          ),
          onTap: () => signOut(context),
        ),
      ),
    );
  }
}

Future<void> signOut(BuildContext context) async {
  await Auth().signOut();
  await Navigator.pushNamedAndRemoveUntil(
      context, SignInPage.routeName, (Route<dynamic> route) => false);
}
