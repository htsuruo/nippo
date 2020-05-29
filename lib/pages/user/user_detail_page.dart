import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:nippo/components/post_list_view_by_user.dart';
import 'package:nippo/components/profile_area.dart';
import 'package:nippo/models/controllers/post/post_controller.dart';
import 'package:nippo/models/controllers/post/post_state.dart';
import 'package:nippo/models/entities/user.dart';
import 'package:provider/provider.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({Key key}) : super(key: key);
  static const String routeName = '/user_detail';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as UserDetailArgs;
    return StateNotifierProvider<PostController, PostState>(
      // TODO(tsuru): wrapped()で切り出したいがargsを受け渡したい
      create: (context) => PostController(uid: args.user.uid),
      builder: (context, _child) => Scaffold(
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
      ),
    );
  }
}

class PostListView extends StatelessWidget {
  const PostListView({
    Key key,
    @required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    final posts = context.select((PostState s) => s.postsByUserId);
    if (posts != null) {
      return PostListViewByUser(
        posts: posts,
        user: user,
      );
    }
    return const Padding(
      padding: EdgeInsets.only(top: 60),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

@immutable
class UserDetailArgs {
  const UserDetailArgs({this.user});
  final User user;
}
