import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/features/post/post_provider.dart';
import 'package:nippo/logger.dart';

class PostDetailPage extends ConsumerWidget {
  const PostDetailPage({super.key, required this.uid, required this.pid});

  final String? uid;
  final String? pid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO(htsuruo): familiyのうけとりをRecordsでTypeDef定義する
    final post = ref.watch(postProvider(uid, pid));

    return Scaffold(
      appBar: AppBar(
        title: const Text('PostDetailPage'),
      ),
      body: post.when(
        data: (postSnapshot) {
          final post = postSnapshot.data();
          if (post == null) {
            return const Center(
              child: Text('データがありません'),
            );
          }
          return Center(
            child: Text(
              post.title,
              style: const TextStyle(fontSize: 24),
            ),
          );
        },
        error: (error, stackTrace) {
          logger.severe(error.toString());
          return Center(
            child: Text(error.toString()),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
