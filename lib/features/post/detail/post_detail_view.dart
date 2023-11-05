import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/common/common.dart';
import 'package:nippo/core/authentication/auth_provider.dart';
import 'package:nippo/features/post/model/post.dart';

class PostDetailView extends ConsumerWidget {
  const PostDetailView({super.key, required this.postSnapAsync});

  final AsyncValue<DocumentSnapshot<Post>?> postSnapAsync;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        actions: const [
          // _MenuButton(),
          Gap(4),
        ],
      ),
      body: postSnapAsync.when(
        loading: CenteredCircularProgressIndicator.new,
        error: (error, stackTrace) {
          return Center(
            child: Text(error.toString()),
          );
        },
        data: (postSnap) {
          if (postSnap == null) {
            return const Center(
              child: Text('データがありません'),
            );
          }
          final post = postSnap.data()!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(4),
                Text('作成日: ${post.createdAt.date!.formatted}'),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Divider(),
                ),
                Text(
                  post.description,
                  style: theme.textTheme.bodyLarge,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _MenuButton extends ConsumerWidget {
  const _MenuButton({required this.postSnap});

  final DocumentSnapshot<Post> postSnap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isMine = ref.watch(firUserProvider.select((s) => s.value?.uid));

    return PopupMenuButton<_MenuItem>(
      icon: const Icon(Icons.more_horiz_outlined),
      onSelected: (item) {
        switch (item) {
          case _MenuItem.edit:
            // TODO(htsuruo): 編集
            break;
          case _MenuItem.delete:
            // TODO(htsuruo): 削除
            // ref.read(postRepositoryProvider).delete(postRef: postRef);
            break;
        }
      },
      itemBuilder: (context) => _MenuItem.values.map((item) {
        final color = item == _MenuItem.delete ? colorScheme.error : null;
        return PopupMenuItem(
          value: item,
          child: Row(
            children: [
              Icon(item.iconData, color: color),
              const Gap(8),
              Text(item.title, style: TextStyle(color: color)),
            ],
          ),
        );
      }).toList(),
    );
  }
}

enum _MenuItem {
  edit(title: '編集', iconData: Icons.edit_outlined),
  delete(title: '削除', iconData: Icons.delete_outline),
  ;

  const _MenuItem({required this.title, required this.iconData});
  final String title;
  final IconData iconData;
}
