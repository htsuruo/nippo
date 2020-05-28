import 'package:flutter/material.dart';
import 'package:nippo/components/molecules/profile_total_post_count.dart';
import 'package:nippo/components/post_card.dart';
import 'package:nippo/models/entities/post.dart';
import 'package:nippo/models/entities/user.dart';

class PostListViewByUser extends StatelessWidget {
  const PostListViewByUser({Key key, this.posts, this.user}) : super(key: key);
  final List<Post> posts;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ProfileTotalPostCount(
          postCount: posts.length,
        ),
        SizedBox(
          height: 200,
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
        )
      ],
    );
    ;
  }
}
