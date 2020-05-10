import 'package:flutter/material.dart';
import 'package:nippo/pages/setting.dart';
import 'package:nippo/states/user_state.dart';
import 'package:provider/provider.dart';
import 'package:nippo/components/profile_area.dart';
import 'package:nippo/components/post_data_list_view_by_user.dart';

@immutable
class ProfilePage extends StatelessWidget {
  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<UserState>(context).user;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(Icons.more_horiz),
//                    color: Colors.white,
                    onPressed: () {
                      Navigator.pushNamed(context, SettingPage.routeName);
                    },
                  ),
                ),
              ),
              ProfileArea(user: currentUser),
              PostDataListViewByUser(user: currentUser, height: 400),
            ],
          ),
        ),
      ),
    );
  }
}
