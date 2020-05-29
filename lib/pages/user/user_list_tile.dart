import 'package:flutter/material.dart';
import 'package:nippo/models/entities/user.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({
    Key key,
    @required this.user,
    @required this.onTap,
  }) : super(key: key);

  final User user;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        user.displayName,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('認証プロバイダ: ${user.providerData}',
              style: const TextStyle(fontSize: 12)),
          Text('最終ログイン: ${user.lastSignInTime}',
              style: const TextStyle(fontSize: 12)),
        ],
      ),
      leading: CircleAvatar(
        child: Image.network(user.photoUrl),
      ),
      trailing: Icon(Icons.navigate_next),
      onTap: onTap,
    );
  }
}
