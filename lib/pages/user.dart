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
      body: FutureBuilder<QuerySnapshot>(
        future: firestore.collection('users').getDocuments(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print('snapshot is $snapshot');
          if (snapshot.hasData) {
            final list = snapshot.data.documents as List<DocumentSnapshot>;
            return UserListView(list: list);
          } else {
            return const Center(child: Text('データが存在しません'));
          }
        },
      ),
    );
  }
}

Future<List<DocumentSnapshot>> getPosts() async {
  final firestore = Firestore.instance;
  final docs = await firestore.collection('users').getDocuments();
  print('docs is $docs');
  print('docs is ${docs.documents}');
  print('length is ${docs.documents.length}');
  return docs.documents;
}

class UserListView extends StatelessWidget {
  UserListView({@required this.list});
  List<DocumentSnapshot> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            title: Text(
              list[index]['description'].toString(),
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            subtitle: Text(list[index]['uid'].toString()),
            leading: Icon(Icons.people),
          ),
        );
      },
      itemCount: list.length,
    );
  }
}
