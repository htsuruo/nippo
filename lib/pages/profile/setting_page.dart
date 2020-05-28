import 'package:flutter/material.dart';
import 'package:nippo/components/organisms/simple_list_container.dart';
import 'package:nippo/components/organisms/simple_list_section.dart';
import 'package:nippo/models/controllers/auth/auth_state.dart';
import 'package:nippo/models/repositories/auth_repository.dart';
import 'package:nippo/pages/auth/sign_in_page.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key key}) : super(key: key);
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
              ...firstSection(context),
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

List<Widget> firstSection(BuildContext context) {
  final currentUser = context.select((AuthState s) => s.user);
  final children = [
    const SimpleListSection(title: 'ログイン情報'),
    const Divider(),
    SimpleListContainer(
      title: '認証プロバイダ',
      trailing: Text(currentUser != null ? currentUser.providerData : '読込中'),
    ),
    const Divider(indent: 16),
    SimpleListContainer(
      title: '最終ログイン日時',
      trailing: Text(currentUser != null ? currentUser.lastSignInTime : '読込中'),
    ),
    const Divider(),
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
      title: 'ディベロッパー',
      trailing: Icon(Icons.open_in_new),
      onTap: () async {
        await launchUrl(url: 'https://scrapbox.io/tsuruo/');
      },
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
  await AuthRepository().signOut();
  await Navigator.pushNamedAndRemoveUntil(
      context, SignInPage.routeName, (Route<dynamic> route) => false);
}

Future<void> launchUrl({String url}) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('Could not Launch $url');
  }
}
