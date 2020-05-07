import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nippo/components/profile_circle_image.dart';
import 'package:nippo/components/profile_total_post_count.dart';
import 'package:nippo/pages/setting.dart';
import 'package:nippo/models/user.dart';
import 'package:nippo/states/user.dart';
import 'package:provider/provider.dart';

@immutable
class ProfilePage extends StatelessWidget {
  static const String routeName = '/profile';
  final FirebaseUser user = null;

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
              const ProfileTotalPostCount(postCount: postCount)
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileArea extends StatelessWidget {
  const ProfileArea({@required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8),
          child: ProfileCircleImage(
            imageUrl: user.photoUrl,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            user.displayName,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text('uid: ${user.uid}')),
      ],
    );
  }
}
