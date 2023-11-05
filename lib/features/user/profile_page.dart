import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/core/authentication/auth_provider.dart';
import 'package:nippo/core/router/router.dart';
import 'package:nippo/features/user/widgets/user_scaffold.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = ref.watch(firUserProvider.select((s) => s.value?.uid));

    return UserScaffold(
      uid: uid,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              SettingPageRoute().push<void>(context);
            },
          ),
        ],
      ),
    );
  }
}
