import 'package:flutter/material.dart';
import 'package:nippo/models/controllers/user/user_state.dart';
import 'package:nippo/models/entities/user.dart';
import 'package:nippo/pages/user/user_detail_page.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key key}) : super(key: key);
  static const String routeName = '/user';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登録者'),
      ),
      body: UserListView(users: context.select((UserState u) => u.users)),
    );
  }
}

class UserListView extends StatelessWidget {
  const UserListView({@required this.users});
  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        final user = users[index];
        return Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
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
            onTap: () {
              Navigator.pushNamed(context, UserDetailPage.routeName,
                  arguments: UserDetailArgs(
                    user: user,
                  ));
            },
          ),
        );
      },
      itemCount: users.length,
    );
  }
}
