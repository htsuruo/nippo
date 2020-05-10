import 'package:flutter/material.dart';
import 'package:nippo/models/post.dart';
import 'package:nippo/components/content_cart.dart';
import 'package:nippo/theme.dart';

class PostDataListView extends StatelessWidget {
  const PostDataListView({this.future});
  final Future<List<Post>> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
        future: future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(VIC.navy)));
            case ConnectionState.done:
              if (!snapshot.hasData) {
                return const Center(child: Text('データが見つかりません'));
              }
              if (snapshot.hasError) {
                return const Center(child: Text('エラーです'));
              }
              final list = snapshot.data as List<Post>;
              return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final data = list[index];
                    final post = Post(
                      title: data.title,
                      description: data.description,
                      createdAt: data.createdAt,
                    );
                    return ContentCard(
                      post: post,
                      user: data.user,
                    );
                  });
            default:
              return const Center(child: Text('hgohoge'));
          }
        });
  }
}
