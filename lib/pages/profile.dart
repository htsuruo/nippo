import 'package:flutter/material.dart';
import 'package:nippo/components/profile_circle_image.dart';
import 'package:nippo/components/profile_total_post_count.dart';
import 'package:nippo/pages/setting.dart';
import 'package:nippo/theme.dart';

class ProfilePage extends StatelessWidget {
  static final String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    const String name = '鶴岡秀樹';
    const String description =
        'FinTech / UI / フロントエンド / 最近はFlutter頑張る人。デザインとエンジニアリング、モノをつくるのが好き。Perfumeはもっと好き。P.T.A. 8年目';
    const String imageUrl =
        'https://i.pinimg.com/originals/05/82/9e/05829e5e6c8e65aa31d7d9ade9e05503.jpg';
    const int postCount = 42;

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
      body: SafeArea(
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(Icons.more_horiz),
                      color: Color(0xFF2D3047),
                      onPressed: () {
                        Navigator.pushNamed(context, SettingPage.routeName);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileCircleImage(
                    imageUrl: imageUrl,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    name,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    description,
                  ),
                ),
                ProfileTotalPostCount(postCount: postCount)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
