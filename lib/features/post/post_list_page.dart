import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/common/common.dart';
import 'package:nippo/features/post/post_provider.dart';
import 'package:nippo/gen/assets.gen.dart';

import 'post.dart';

class PostListPage extends StatelessWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Assets.images.icons.nippoYoko.svg(
          height: 24,
        ),
      ),
      body: const _ListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/posts/create');
        },
        child: const Icon(Icons.mode_edit),
      ),
    );
  }
}

class _ListView extends ConsumerWidget {
  const _ListView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postsProvider).value;
    return posts == null
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: posts.length,
            itemBuilder: (context, index) => _PostCard(post: posts[index]),
          );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 1,
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
                    ),
                    Text(
                      post.description,
                      style: theme.textTheme.bodyMedium,
                    ),
                    const Gap(2),
                    Text(
                      post.createdAt.date!.formatted,
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
