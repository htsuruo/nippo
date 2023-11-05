import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/core/authentication/auth_provider.dart';
import 'package:nippo/core/router/router.dart';

import '../post/post_provider.dart';
import '../post/widgets/widgets.dart';
import 'widgets/profile.dart';

class UserPage extends ConsumerWidget {
  const UserPage._({this.uid, required this.isMe});

  // 投稿一覧からユーザーアバターを押下した場合はそのユーザーのプロフィールを表示する
  const UserPage.uid(String uid) : this._(uid: uid, isMe: false);

  // プロフィールタブを押下した場合は自分のプロフィールを表示する
  const UserPage.me() : this._(isMe: true);

  final String? uid;
  final bool isMe;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = isMe
        ? ref.watch(firUserProvider.select((s) => s.value?.uid))
        : this.uid;

    return Scaffold(
      appBar: AppBar(
        actions: [
          if (isMe)
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
          Profile(uid: uid),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(),
          ),
          if (uid != null)
            Expanded(
              child: PostListView(
                snapshots: ref.watch(userPostsProvider(uid)).value,
                postSelected: (postId) {
                  UserPostPageRoute(uid: uid, pid: postId).push<void>(context);
                },
              ),
            ),
        ],
      ),
    );
  }
}
