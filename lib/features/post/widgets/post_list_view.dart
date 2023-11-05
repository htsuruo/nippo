import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/common/common.dart';
import 'package:nippo/core/router/router.dart';
import 'package:nippo/features/user/user_provider.dart';

import '../model/post.dart';

/// Post一覧からの遷移とUserPageからの遷移で共通して利用されるListView
/// StatefulShellRouteの影響でパスを同一に出来ないため、
/// それぞれの遷移元に合わせて[postSelected]にて遷移先を指定する。
class PostListView extends ConsumerWidget {
  const PostListView({
    super.key,
    required this.snapshots,
    required this.postSelected,
  });

  final List<QueryDocumentSnapshot<Post>>? snapshots;
  final ValueChanged<String>? postSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snapshots = this.snapshots;

    return snapshots == null
        ? const CenteredCircularProgressIndicator()
        : snapshots.isEmpty
            ? const Center(
                child: Text('データがありません'),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: snapshots.length,
                itemBuilder: (context, index) => _PostCard(
                  snapshots[index],
                  postSelected: postSelected,
                ),
              );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard(this.postSnapshot, {required this.postSelected});

  final QueryDocumentSnapshot<Post> postSnapshot;
  final ValueChanged<String>? postSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final post = postSnapshot.data();

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          postSelected?.call(postSnapshot.id);
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _UserAvatar(postRef: postSnapshot.reference),
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
    );
  }
}

class _UserAvatar extends ConsumerWidget {
  const _UserAvatar({required this.postRef});

  final DocumentReference<Post> postRef;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // users/[uid]/posts/[postId]
    final userSnapshot =
        ref.watch(userProvider(uid: postRef.path.split('/')[1])).value;
    const placeHolder = CircleAvatar();
    return userSnapshot == null
        ? placeHolder
        : InkWell(
            onTap: () {
              UserPageRoute(uid: userSnapshot.id).go(context);
            },
            child: CachedNetworkImage(
              imageUrl: userSnapshot.data()?.photoUrl ?? '',
              placeholder: (context, _) => placeHolder,
              imageBuilder: (context, imageProvider) {
                return CircleAvatar(backgroundImage: imageProvider);
              },
            ),
          );
  }
}
