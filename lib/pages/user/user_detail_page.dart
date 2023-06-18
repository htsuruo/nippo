import 'package:flutter/material.dart';
import 'package:nippo/components/post_list_view_by_user.dart';
import 'package:nippo/components/profile_area.dart';
import 'package:nippo/models/controllers/post/post_controller.dart';
import 'package:nippo/models/controllers/post/post_state.dart';
import 'package:nippo/models/entities/user.dart';
import 'package:provider/provider.dart';

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
