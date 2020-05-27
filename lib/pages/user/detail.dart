import 'package:flutter/material.dart';
import 'package:nippo/components/organisms/post_data_list_view_by_user.dart';
import 'package:nippo/components/organisms/profile_area.dart';
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
