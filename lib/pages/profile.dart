import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nippo/components/profile_circle_image.dart';
import 'package:nippo/components/profile_total_post_count.dart';
import 'package:nippo/pages/setting.dart';
import 'package:nippo/services/auth.dart';

@immutable
class ProfilePage extends StatelessWidget {
  static const String routeName = '/profile';
  final FirebaseUser user = null;

  @override
  Widget build(BuildContext context) {
    const name = '鶴岡秀樹';
    const description = 'Google認証';
    const imageUrl =
        'https://i.pinimg.com/originals/05/82/9e/05829e5e6c8e65aa31d7d9ade9e05503.jpg';
    const postCount = 42;

    return Scaffold(
//        appBar: AppBar(
//          backgroundColor: Colors.white,
//          elevation: 0.0,
//          actions: <Widget>[
//            IconButton(
//              color: Colors.black,
//              icon: Icon(Icons.add_alert),
//              tooltip: 'show hogehoge',
//              onPressed: () {},
//            )
//          ],
//        ),
      body: Container(
//        color: Color(0xFF2D3047),
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
              FutureBuilder(
                  future: Auth().currentUser(),
                  builder:
                      (BuildContext context, AsyncSnapshot<User> snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return const CircularProgressIndicator();
                    }
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    if (snapshot.hasData) {
                      return ProfileArea(
                        user: snapshot.data,
                      );
                    } else {
                      return const Text('データ存在しません');
                    }
                  }),
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
