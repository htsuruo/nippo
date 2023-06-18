import 'package:flutter/material.dart';
import 'package:nippo/models/controllers/auth/auth_state.dart';
import 'package:nippo/models/entities/user.dart';
import 'package:nippo/pages/setting/sign_out_button.dart';
import 'package:nippo/pages/setting/simple_list_section.dart';
import 'package:nippo/pages/setting/simple_list_tile.dart';
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
              ...firstSection(
                currentUser: context.select((AuthState s) => s.user),
              ),
              ...secondSection(),
              const SizedBox(
                height: 32,
              ),
              const SignOutButton(),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> firstSection({User currentUser}) {
  final children = [
    const SimpleListSection(title: 'ログイン情報'),
    const Divider(),
    SimpleListTile(
      title: '認証プロバイダ',
      trailing: Text(currentUser != null ? currentUser.providerData : '読込中'),
    ),
    const Divider(indent: 16),
    SimpleListTile(
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
    SimpleListTile(
      title: 'ディベロッパー',
      trailing: const Icon(Icons.open_in_new),
      onTap: () async {
        await launchUrl(url: 'https://scrapbox.io/tsuruo/');
      },
    ),
    const Divider(indent: 16),
    const SimpleListTile(
      title: 'バージョン',
      trailing: Text('1.0.0'),
    ),
    const Divider(),
  ];
  return children;
}

Future<void> launchUrl({String url}) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('Could not Launch $url');
  }
}
