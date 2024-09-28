import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/features/post/detail/post_action_handler.dart';
import 'package:nippo/features/user/model/user.dart';

class PostActionMenuButton extends ConsumerWidget {
  const PostActionMenuButton({super.key, required this.postAsync});

  final AsyncValue<Post?> postAsync;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final post = postAsync.value;
    // TODO(htsuruo): どうやるか検討
    // final isMine = ref.watch(
    //   firUserProvider.select(
    //     (s) => s.value?.uid == post?.reference.id,
    //   ),
    // );

    const isMine = true;

    return !isMine
        ? const SizedBox.shrink()
        : PopupMenuButton<_MenuItem>(
            icon: const Icon(Icons.more_horiz_outlined),
            // TODO(htsuruo): 書き換える
            onSelected: post == null
                ? null
                : (item) async {
                    final handler = ref.read(postActionProvider);
                    switch (item) {
                      case _MenuItem.edit:
                        await handler.edit(post: post);
                      case _MenuItem.delete:
                        await handler.delete(post: post);
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
