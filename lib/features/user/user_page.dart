import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/core/authentication/auth_provider.dart';
import 'package:nippo/features/post/widgets/post_list_view.dart';
import 'package:nippo/router.dart';

import '../post/post_provider.dart';
import 'widgets/widgets.dart';

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
              context.push('/setting');
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const UserProfileView(),
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
