import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/common/common.dart';
import 'package:nippo/features/post/post_provider.dart';

import 'post.dart';

class PostListView extends ConsumerWidget {
  const PostListView({super.key, this.uid});

  final String? uid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = this.uid;
    // TODO(tsuruoka): Providerを分けずにまとめても良いかも
    final posts = uid == null
        ? ref.watch(postsProvider).value
        : ref.watch(userPostsProvider(uid)).value;
    return posts == null
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: posts.length,
            itemBuilder: (context, index) => _PostCard(posts[index]),
          );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard(this.post);

  final Post post;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title,
                      style: theme.textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      post.description,
                      style: theme.textTheme.bodyMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Gap(2),
                    Text(
                      // ServerTimestamp確定まで微妙にラグがあるため暫定的に空文字でごまかす
                      post.createdAt.date?.formatted ?? '',
                      style: theme.textTheme.labelSmall!
                          .copyWith(color: theme.hintColor),
                    ),
                  ],
                ),
              ),
              Icon(Icons.navigate_next, color: colorScheme.primary),
            ],
          ),
        ),
      ),
    );
  }
}
