import 'package:flutter/material.dart';

class ProfileTotalPostCount extends StatelessWidget {
  const ProfileTotalPostCount({super.key, @required this.postCount});

  final int postCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Divider(
            height: 32,
          ),
          Text(
            postCount.toString(),
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const Text('投稿数'),
          const Divider(
            height: 32,
          ),
        ],
      ),
    );
  }
}
