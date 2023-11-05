import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/core/router/router.dart';
import 'package:nippo/features/post/post_provider.dart';
import 'package:nippo/features/post/widgets/widgets.dart';

import 'profile.dart';

class UserScaffold extends ConsumerWidget {
  const UserScaffold({super.key, required this.uid, this.appBar});

  final String? uid;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = this.uid;

    return Scaffold(
      appBar: appBar ?? AppBar(),
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
                  UserPostPageRoute(uid: uid, pid: postId).go(context);
                },
              ),
            ),
        ],
      ),
    );
  }
}
