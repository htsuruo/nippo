import 'package:flutter/material.dart';

import 'model/user.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({
    super.key,
    required this.user,
    required this.onTap,
  });

  final User user;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        user.displayName,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '認証プロバイダ: ${user.providerData}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            '最終ログイン: ${user.lastSignInTime}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
      leading: CircleAvatar(
        child: Image.network(user.photoUrl),
      ),
      trailing: const Icon(Icons.navigate_next),
      onTap: onTap,
    );
  }
}
