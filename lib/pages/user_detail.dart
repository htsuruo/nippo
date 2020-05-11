import 'package:flutter/material.dart';
import 'package:nippo/components/profile_area.dart';
import 'package:nippo/components/profile_total_post_count.dart';
import 'package:nippo/models/post.dart';
import 'package:nippo/models/user.dart';
import 'package:nippo/repositories/post_repository.dart';
import 'package:nippo/components/post_data_list_view_by_user.dart';

class UserDetailPage extends StatelessWidget {
  UserDetailPage({@required this.user});
  static const String routeName = '/user_detail';
  User user;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as UserDetailPage;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              ProfileArea(user: args.user),
              PostDataListViewByUser(user: args.user),
            ],
          ),
        ),
      ),
    );
  }
}
