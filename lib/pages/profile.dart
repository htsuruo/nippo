import 'package:flutter/material.dart';
import 'package:nippo/components/profile_total_post_count.dart';
import 'package:nippo/pages/setting.dart';
import 'package:nippo/states/user_state.dart';
import 'package:provider/provider.dart';
import 'package:nippo/components/profile_area.dart';

@immutable
class ProfilePage extends StatelessWidget {
  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    const postCount = 42;

    return Scaffold(
      body: Container(
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
              ProfileArea(user: Provider.of<UserState>(context).user),
              const ProfileTotalPostCount(postCount: postCount),
            ],
          ),
        ),
      ),
    );
  }
}
