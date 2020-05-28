import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:nippo/components/atoms/app_logo.dart';
import 'package:nippo/components/post_card.dart';
import 'package:nippo/models/controllers/post/post_controller.dart';
import 'package:nippo/models/controllers/post/post_state.dart';
import 'package:nippo/models/entities/post.dart';
import 'package:nippo/pages/post/post_create_page.dart';
import 'package:nippo/theme.dart';
import 'package:provider/provider.dart';

class PostListPage extends StatelessWidget {
  const PostListPage._({Key key}) : super(key: key);

  static Widget wrapped() {
    return StateNotifierProvider<PostController, PostState>(
      create: (context) => PostController(),
      child: const PostListPage._(),
    );
  }

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
    if (posts != null) {
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
    // TODO(tsuruoka):読込中にインジケータを表示したいが表示されない.
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
