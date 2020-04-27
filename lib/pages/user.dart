import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  static final String routeName = '/user';

  var listItems = ['one', 'two', 'three'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登録者'),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                'user $index .',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
              ),
              subtitle: Text('Google認証'),
              leading: Icon(Icons.people),
            ),
          );
        },
        itemCount: listItems.length,
      ),
    );
  }
}
