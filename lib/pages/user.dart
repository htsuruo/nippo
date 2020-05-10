import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nippo/pages/user_detail.dart';
import 'package:nippo/repositories/user_repository.dart';
import 'package:nippo/models/user.dart';

@immutable
class UserPage extends StatelessWidget {
  static const String routeName = '/user';
  final Firestore fireStore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登録者'),
      ),
      body: FutureBuilder<List<User>>(
        future: UserRepository().fetchAll(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print('snapshot is $snapshot');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: Text('データを読込中..'));
            case ConnectionState.done:
              if (!snapshot.hasData) {
                return Container();
              }
              if (snapshot.hasError) {
                return const Center(child: Text('エラーです'));
              }
              final users = snapshot.data as List<User>;
              return UserListView(users: users);
            default:
              return const Center(child: Text('hgohoge'));
          }
        },
      ),
    );
  }
}

class UserListView extends StatelessWidget {
  UserListView({@required this.users});
  List<User> users;

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
                Text('認証プロバイダ: ${user.providerData}'),
                Text('最終ログイン: ${user.lastSignInTime}'),
              ],
            ),
            leading: CircleAvatar(
              child: Image.network(user.photoUrl),
            ),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              Navigator.pushNamed(context, UserDetailPage.routeName,
                  arguments: UserDetailPage(
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
