import 'package:flutter/material.dart';
import 'package:nippo/common/common.dart';
import 'package:provider/provider.dart';

import '../post/post_controller.dart';
import '../post/post_state.dart';
import 'model/user.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({super.key});
  static const String routeName = '/user_detail';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as UserDetailArgs;
    context.watch<PostController>().fetchByUser(uid: args.user.uid);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              ProfileArea(user: args.user),
              PostListView(user: args.user),
            ],
          ),
        ),
      ),
    );
  }
}

class PostListView extends StatelessWidget {
  const PostListView({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    final posts = context.select((PostState s) => s.postsByUserId);
    return PostListViewByUser(
      posts: posts,
      user: user,
    );
  }
}

@immutable
class UserDetailArgs {
  const UserDetailArgs({required this.user});
  final User user;
}
