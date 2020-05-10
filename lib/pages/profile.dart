import 'package:flutter/material.dart';
import 'package:nippo/components/profile_total_post_count.dart';
import 'package:nippo/models/post.dart';
import 'package:nippo/pages/setting.dart';
import 'package:nippo/states/user_state.dart';
import 'package:provider/provider.dart';
import 'package:nippo/components/profile_area.dart';
import 'package:nippo/repositories/post_repository.dart';

@immutable
class ProfilePage extends StatelessWidget {
  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<UserState>(context).user;

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
              ProfileArea(user: currentUser),
              FutureBuilder<List<Post>>(
                  future: PostRepository().fetchByUser(uid: currentUser.uid),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    final list = snapshot.data as List<Post>;
                    return Column(
                      children: <Widget>[
                        ProfileTotalPostCount(postCount: list.length),
//                        ListView.builder(
//                          itemBuilder: (context, index) {
//                            return Text("da");
//                          },
//                          itemCount: list.length,
//                        )
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
