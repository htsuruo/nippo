import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/common/common.dart';
import 'package:nippo/features/post/model/post.dart';

class PostDetailView extends ConsumerWidget {
  const PostDetailView({super.key, required this.postAsync});

  final AsyncValue<Post?> postAsync;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: postAsync.when(
        loading: CenteredCircularProgressIndicator.new,
        error: (error, stackTrace) {
          return Center(
            child: Text(error.toString()),
          );
        },
        data: (post) {
          if (post == null) {
            return const Center(
              child: Text('データがありません'),
            );
          }
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
