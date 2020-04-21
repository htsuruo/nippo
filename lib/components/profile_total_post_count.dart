import 'package:flutter/material.dart';

class ProfileTotalPostCount extends StatelessWidget {
  const ProfileTotalPostCount({
    Key key,
    @required this.postCount,
  }) : super(key: key);

  final int postCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF0F0F0),
      width: double.infinity,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            postCount.toString(),
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w900),
          ),
          Text('投稿数')
        ],
      ),
    );
  }
}
