import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nippo/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@immutable
class UserPage extends StatelessWidget {
  static const String routeName = '/user';

  final List<String> listItems = ['one', 'two', 'three'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登録者'),
      ),
      body: UserListView(listItems: listItems),
    );
  }
}

class UserListView extends StatelessWidget {
  const UserListView({
    @required this.listItems,
  });

  final List<String> listItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            title: Text(
              'user $index .',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            subtitle: const Text('Google認証'),
            leading: Icon(Icons.people),
          ),
        );
      },
      itemCount: listItems.length,
    );
  }
}
