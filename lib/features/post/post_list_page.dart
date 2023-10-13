import 'package:flutter/material.dart';
import 'package:nippo/common/common.dart';
import 'package:nippo/features/post/post_list_view.dart';
import 'package:nippo/router.dart';

class PostListPage extends StatelessWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppLogo(height: 28),
      ),
      body: const PostListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          PostCreatePageRoute().go(context);
        },
        child: const Icon(Icons.mode_edit),
      ),
    );
  }
}
