import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../services/auth_state.dart';
import '../user/model/user.dart';
import 'sign_out_button.dart';
import 'simple_list_section.dart';
import 'simple_list_tile.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});
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
    );
  }
}

List<Widget> firstSection({required User currentUser}) {
  final lastSignInTime = currentUser.lastSignInTime;
  final providerData = currentUser.providerData;
  final children = [
    const SimpleListSection(title: 'ログイン情報'),
    const Divider(),
    SimpleListTile(
      title: '認証プロバイダ',
      trailing: providerData == null ? null : Text(providerData),
      // trailing: Text(currentUser.providerData),
    ),
    const Divider(indent: 16),
    SimpleListTile(
      title: '最終ログイン日時',
      trailing: lastSignInTime == null ? null : Text(lastSignInTime),
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

Future<void> launchUrl({required String url}) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('Could not Launch $url');
  }
}
