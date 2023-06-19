import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/user.dart';
import 'user_detail_page.dart';
import 'user_list_tile.dart';
import 'user_state.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});
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
  const UserListView({super.key, required this.users});
  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        final user = users[index];
        return Padding(
          padding: const EdgeInsets.all(8),
          child: UserListTile(
            user: user,
            onTap: () => Navigator.pushNamed(
              context,
              UserDetailPage.routeName,
              arguments: UserDetailArgs(
                user: user,
              ),
            ),
          ),
        );
      },
      itemCount: users.length,
    );
  }
}
