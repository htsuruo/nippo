import 'package:flutter/material.dart';
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
      body: const SafeArea(
        child: _ListView(posts: []),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<MaterialPageRoute<void>>(
              builder: (BuildContext context) {
                return const SizedBox.shrink();
                // return PostCreatePage.wrapped();
              },
              fullscreenDialog: true,
            ),
          );
        },
        child: const Icon(Icons.mode_edit),
      ),
    );
  }
}

class _ListView extends StatelessWidget {
  const _ListView({
    required this.posts,
  });

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final data = posts[index];
        final post = Post(
          title: data.title,
          description: data.description,
          createdAt: data.createdAt,
        );
        // TODO(tsuruoka): 仮
        return const SizedBox.shrink();
        // return PostCard(
        //   post: post,
        //   user: data.user!,
        // );
      },
    );
  }
}
