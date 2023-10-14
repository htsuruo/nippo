import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/features/post/detail/post_detail_view.dart';
import 'package:nippo/features/post/post_provider.dart';

class PostDetailPage extends ConsumerWidget {
  const PostDetailPage({super.key, required this.pid});

  final String? pid;

  @override
  Widget build(BuildContext context, WidgetRef ref) => PostDetailView(
        postAsync: ref.watch(postProvider(pid)).whenData(
              (snapshot) => snapshot?.data(),
            ),
      );
}
