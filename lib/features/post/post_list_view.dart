import 'package:flutter/material.dart';
import 'package:nippo/common/common.dart';
import 'package:nippo/features/post/model/post.dart';
import 'package:provider/provider.dart';

import 'post_state.dart';

class PostListView extends StatelessWidget {
  const PostListView({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = context.select((PostState s) => s.posts);
    if (posts.isNotEmpty) {
      return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final data = posts[index];
          final post = Post(
            title: data.title,
            description: data.description,
            createdAt: data.createdAt,
          );
          return PostCard(
            post: post,
            user: data.user!,
          );
        },
      );
    }
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}