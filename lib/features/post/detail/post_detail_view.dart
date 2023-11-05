import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/common/common.dart';
import 'package:nippo/features/post/model/post.dart';

class PostDetailView extends ConsumerWidget {
  const PostDetailView({super.key, required this.postSnap});

  final DocumentSnapshot<Post>? postSnap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final postSnap = this.postSnap;
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
  }
}
