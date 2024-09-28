import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/common/common.dart';
import 'package:nippo/features/user/model/user.dart';

import 'user_avatar.dart';

/// Post一覧からの遷移とUserPageからの遷移で共通して利用されるListView
/// StatefulShellRouteの影響でパスを同一に出来ないため、
/// それぞれの遷移元に合わせて[postSelected]にて遷移先を指定する。
class PostListView extends ConsumerWidget {
  const PostListView({
    super.key,
    required this.posts,
    required this.postSelected,
  });

  final List<Post>? posts;
  final ValueChanged<String>? postSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = this.posts;

    return posts == null
        ? const CenteredCircularProgressIndicator()
        : posts.isEmpty
            ? const Center(
                child: Text('データがありません'),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: posts.length,
                itemBuilder: (context, index) => _PostCard(
                  posts[index],
                  postSelected: postSelected,
                ),
              );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard(this.post, {required this.postSelected});

  final Post post;
  final ValueChanged<String>? postSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          postSelected?.call(post.id);
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: UserAvatar(post: post),
                ),
                const Gap(12),
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
      ),
    );
  }
}
