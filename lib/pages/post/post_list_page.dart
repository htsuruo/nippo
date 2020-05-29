import 'package:flutter/material.dart';
import 'package:nippo/components/app_logo.dart';
import 'package:nippo/components/post_card.dart';
import 'package:nippo/models/controllers/post/post_state.dart';
import 'package:nippo/models/entities/post.dart';
import 'package:nippo/pages/post/post_create_page.dart';
import 'package:nippo/theme.dart';
import 'package:provider/provider.dart';

class PostListPage extends StatelessWidget {
  const PostListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const AppLogo(height: 50),
      ),
      body: const SafeArea(
        child: PostListView(),
      ),
      floatingActionButton: FAB(),
    );
  }
}

class PostListView extends StatelessWidget {
  const PostListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posts = context.select((PostState s) => s.posts);
    if (posts != null && posts.isNotEmpty) {
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
            user: data.user,
          );
        },
      );
    }
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class FAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute<MaterialPageRoute>(
              builder: (BuildContext context) {
                return CreatePage();
              },
              fullscreenDialog: true,
            ));
      },
      child: Icon(Icons.mode_edit),
      backgroundColor: VIC.red,
      foregroundColor: Colors.white,
    );
  }
}
