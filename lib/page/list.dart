import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  var _tabcontroller = new DefaultTabController(
    length: 2,
    child: Scaffold(
      appBar: AppBar(
        bottom: TabBar(tabs: [
          Tab(icon: Icon(Icons.directions_car)),
          Tab(icon: Icon(Icons.directions_transit)),
        ]),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text('this is list page'),
    ));
  }
}
