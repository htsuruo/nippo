import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nippo/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@immutable
class UserPage extends StatelessWidget {
  static const String routeName = '/user';

  final List<String> listItems = ['one', 'two', 'three'];
  final firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登録者'),
      ),
      body: FutureBuilder<List<DocumentSnapshot>>(
        future: getPosts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print('snapshot is $snapshot');
          if (snapshot.hasData) {
            print('snapshot.data is ${snapshot.data}');
            return UserListView();
          } else {
            return const Text('データが存在しません');
          }
        },
      ),
    );
  }
}

Future<List<DocumentSnapshot>> getPosts() async {
  final firestore = Firestore.instance;
  final docs = await firestore.collection('posts').getDocuments();
  print('docs is $docs');
  print('docs is ${docs.documents}');
  print('length is ${docs.documents.length}');
  return docs.documents;
}

class UserListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            title: Text(
              '$index',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            subtitle: const Text('Google認証'),
            leading: Icon(Icons.people),
          ),
        );
      },
      itemCount: 1,
    );
  }
}
