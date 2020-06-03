import 'package:flutter/material.dart';
import 'package:nippo/components/app_logo.dart';
import 'package:nippo/pages/post/post_create_page.dart';

import 'post_list_view.dart';

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
      floatingActionButton: PostFloatingActionButton(),
    );
  }
}

class PostFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute<MaterialPageRoute>(
              builder: (BuildContext context) {
                return PostCreatePage.wrapped();
              },
              fullscreenDialog: true,
            ));
      },
      child: Icon(Icons.mode_edit),
    );
  }
}
