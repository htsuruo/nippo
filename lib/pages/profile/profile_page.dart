import 'package:flutter/material.dart';
import 'package:nippo/components/organisms/post_data_list_view_by_user.dart';
import 'package:nippo/components/organisms/profile_area.dart';
import 'package:nippo/models/controllers/auth_controller/auth_state.dart';
import 'package:nippo/pages/profile/setting_page.dart';
import 'package:provider/provider.dart';

@immutable
class ProfilePage extends StatelessWidget {
  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<AuthState>(context).user;

    return Scaffold(
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
              PostDataListViewByUser(user: currentUser),
            ],
          ),
        ),
      ),
    );
  }
}
