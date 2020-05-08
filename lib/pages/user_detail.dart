import 'package:flutter/material.dart';
import 'package:nippo/components/profile_area.dart';
import 'package:nippo/components/profile_total_post_count.dart';
import 'package:nippo/models/user.dart';

class UserDetailPage extends StatelessWidget {
  UserDetailPage({@required this.user});
  static const String routeName = '/user_detail';
  User user;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as UserDetailPage;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ProfileArea(user: args.user),
            const ProfileTotalPostCount(postCount: 20),
          ],
        ),
      ),
    );
  }
}
