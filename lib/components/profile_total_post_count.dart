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
      width: double.infinity,
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Divider(
            height: 32,
          ),
          Text(
            postCount.toString(),
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w900),
          ),
          Text('投稿数'),
          const Divider(
            height: 32,
          ),
        ],
      ),
    );
  }
}
