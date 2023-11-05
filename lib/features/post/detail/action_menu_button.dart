import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/core/authentication/auth_provider.dart';

import '../model/post.dart';

class ActionMenuButton extends ConsumerWidget {
  const ActionMenuButton({super.key, required this.postSnapAsync});

  final AsyncValue<DocumentSnapshot<Post>?> postSnapAsync;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final postSnap = postSnapAsync.value;
    final isMine = ref.watch(
      firUserProvider.select(
        (s) => s.value?.uid == postSnap?.reference.uid,
      ),
    );

    return !isMine
        ? const SizedBox.shrink()
        : PopupMenuButton<_MenuItem>(
            icon: const Icon(Icons.more_horiz_outlined),
            onSelected: postSnap == null
                ? null
                : (item) {
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
