import 'package:flutter/material.dart';
import 'package:nippo/features/post/post.dart';

import '../../features/user/user.dart';
import 'post_card.dart';
import 'profile_total_post_count.dart';

class PostListViewByUser extends StatelessWidget {
  const PostListViewByUser({
    super.key,
    required this.posts,
    required this.user,
  });
  final List<Post> posts;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          ProfileTotalPostCount(
            postCount: posts.length,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final data = posts[index];
                final post = Post(
                  title: data.title,
                  description: data.description,
                  createdAt: data.createdAt,
                );
                return PostCard(
                  post: post,
                  user: user,
                );
              },
              itemCount: posts.length,
            ),
          ),
        ],
      ),
    );
  }
}
