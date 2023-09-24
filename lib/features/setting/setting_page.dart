import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intersperse/intersperse.dart';
import 'package:nippo/common/extensions/date_time.dart';
import 'package:nippo/core/authentication/auth_provider.dart';
import 'package:nippo/core/authentication/auth_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '設定',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const _FirUserSection(),
            const _AboutSection(),
            const _SignoutButton(),
          ].intersperseOuter(const Gap(16)).toList(),
        ),
      ),
    );
  }
}

const _dividerWithIndent = Divider(indent: 16);

class _FirUserSection extends ConsumerWidget {
  const _FirUserSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firUser = ref.watch(firUserProvider).value;
    final providerData = firUser?.providerData.map((p) => p.providerId);
    final lastSignInTime = firUser?.metadata.lastSignInTime;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionText(label: 'ログイン情報'),
        ListTile(
          title: const Text('認証プロバイダ'),
          trailing: providerData == null
              ? null
              : Text(
                  providerData.join(','),
                ),
        ),
        _dividerWithIndent,
        ListTile(
          title: const Text('最終ログイン日時'),
          trailing: lastSignInTime == null
              ? null
              : Text(lastSignInTime.toLocal().formatted),
        ),
      ],
    );
  }
}

class _AboutSection extends StatelessWidget {
  const _AboutSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionText(label: 'このアプリについて'),
        ListTile(
          title: const Text('ソースコード'),
          trailing: const Icon(Icons.open_in_new_outlined),
          onTap: () => launchUrl(
            Uri(
              scheme: 'https',
              host: 'github.com',
              path: 'htsuruo/nippo',
            ),
          ),
        ),
        _dividerWithIndent,
        const AboutListTile(),
      ],
    );
  }
}

class _SignoutButton extends ConsumerWidget {
  const _SignoutButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        ref.read(authRepositoryProvider).signOut();
      },
      child: const Text('Sign out'),
    );
  }
}

class _SectionText extends StatelessWidget {
  const _SectionText({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        label,
        style: TextStyle(color: colorScheme.primary),
      ),
    );
  }
}
