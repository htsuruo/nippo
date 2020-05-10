import 'package:flutter/material.dart';
import 'package:nippo/models/user.dart';
import 'package:nippo/models/post.dart';
import 'package:nippo/repositories/post_repository.dart';
import 'package:nippo/components/profile_total_post_count.dart';
import 'package:nippo/components/content_cart.dart';

class PostDataListViewByUser extends StatelessWidget {
  const PostDataListViewByUser({@required this.user, @required this.height});

  final User user;
  final double height; //TODO(tsuruoka):height指定ではなく、Expandedで幅いっぱいまで広げたい

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
        future: PostRepository().fetchByUser(uid: user.uid),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Container(
                child: const CircularProgressIndicator(),
                margin: const EdgeInsets.only(top: 50),
              );
            case ConnectionState.done:
              if (!snapshot.hasData) {
                return const Center(child: Text('データが見つかりません'));
              }
              if (snapshot.hasError) {
                return const Center(child: Text('エラーです'));
              }
              final list = snapshot.data as List<Post>;
              return Column(
                children: <Widget>[
                  ProfileTotalPostCount(postCount: list.length),
                  SizedBox(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        final data = list[index];
                        final post = Post(
                          title: data.title,
                          description: data.description,
                          createdAt: data.createdAt,
                        );
                        return ContentCard(
                          post: post,
                          user: user,
                        );
                      },
                      itemCount: list.length,
                    ),
                    height: height,
                  )
                ],
              );
            default:
              return const Text('default');
          }
        });
  }
}
