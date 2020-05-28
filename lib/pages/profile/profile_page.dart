import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:nippo/components/atoms/profile_area.dart';
import 'package:nippo/components/organisms/post_list_view_by_user.dart';
import 'package:nippo/models/controllers/auth/auth_state.dart';
import 'package:nippo/models/controllers/post/post_controller.dart';
import 'package:nippo/models/controllers/post/post_state.dart';
import 'package:nippo/models/entities/user.dart';
import 'package:nippo/pages/profile/setting_page.dart';
import 'package:provider/provider.dart';

@immutable
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);
  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    final currentUser = context.select((AuthState s) => s.user);
    return StateNotifierProvider<PostController, PostState>(
      //TODO(tsuru):wrapped()で切り出しつつcontext.readでcurrentUserを受け取りたい
      create: (context) => PostController(uid: currentUser.uid),
      builder: (context, _child) => Scaffold(
        body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(Icons.more_horiz),
                      onPressed: () {
                        Navigator.pushNamed(context, SettingPage.routeName);
                      },
                    ),
                  ),
                ),
                ProfileArea(user: currentUser),
                PostListView(user: currentUser),
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
    if (posts == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return PostListViewByUser(
      posts: posts,
      user: user,
    );
  }
}
