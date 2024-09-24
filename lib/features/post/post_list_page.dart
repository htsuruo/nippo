import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/common/common.dart';
import 'package:nippo/core/router/router.dart';
import 'package:nippo/features/post/post_provider.dart';

import 'widgets/widgets.dart';

class PostListPage extends ConsumerWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsSnapshots = ref.watch(postsProvider).value;

    return Scaffold(
      appBar: AppBar(
        title: const AppLogo(height: 28),
      ),
      body: PostListView(
        snapshots: postsSnapshots,
        postSelected: (postId) {
          PostPageRoute(pid: postId).push<void>(context);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          PostCreatePageRoute().go(context);
        },
        child: const Icon(Icons.mode_edit),
      ),
    );
  }
}
