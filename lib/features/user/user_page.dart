import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/common/widgets/widgets.dart';
import 'package:nippo/core/authentication/auth_provider.dart';
import 'package:nippo/core/router/router.dart';
import 'package:nippo/features/post/widgets/post_list_view.dart';

import '../post/post_provider.dart';
import 'user_provider.dart';

class UserPage extends ConsumerWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = ref.watch(firUserProvider.select((s) => s.value?.uid));

    return Scaffold(
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // TODO(htsuruo): uidを選択されたユーザーのuidにする
          _Profile(uid: uid),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(),
          ),
          // TODO(htsuruo): ログインユーザーに固定されているが、実際はuidは外から指定された値にする
          if (uid != null)
            Expanded(
              child: PostListView(
                snapshots: ref.watch(userPostsProvider(uid)).value,
                postSelected: (postId) {
                  UserPostPageRoute(uid: uid, pid: postId).go(context);
                },
              ),
            ),
        ],
      ),
    );
  }
}

class _Profile extends ConsumerWidget {
  const _Profile({required this.uid});

  final String? uid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDoc = ref.watch(userProvider(uid: uid)).value;
    final user = userDoc?.data();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: CircularImage(
            imageUrl: user?.photoUrl,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            user?.name ?? '',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(userDoc?.id ?? ''),
        ),
      ],
    );
  }
}
