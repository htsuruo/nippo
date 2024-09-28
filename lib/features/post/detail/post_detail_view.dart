import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/common/common.dart';
import 'package:nippo/features/user/model/user.dart';
import 'package:smooth_highlight/smooth_highlight.dart';

class PostDetailView extends ConsumerWidget {
  const PostDetailView({super.key, required this.post});

  final Post? post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final post = this.post;
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
          _Highlight<String>(
            value: post.title,
            child: Text(
              post.title,
              style: theme.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Gap(4),
          Text('作成日: ${post.createdAt.date!.formatted}'),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(),
          ),
          _Highlight<String>(
            value: post.description,
            child: Text(
              post.description,
              style: theme.textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}

// TODO(htsuruo): アニメーションの開始が早くてチラついてしまうので、ディレイを設定できるようにする
class _Highlight<T> extends StatelessWidget {
  const _Highlight({
    super.key,
    required this.value,
    required this.child,
  });

  final T? value;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ValueChangeHighlight<T>(
      value: value,
      color: colorScheme.primary.withOpacity(.4),
      child: child,
    );
  }
}
