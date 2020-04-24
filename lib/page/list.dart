import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  var _tabcontroller = new DefaultTabController(
    length: 2,
    child: Scaffold(
      appBar: AppBar(
//        flexibleSpace: Column(
//          mainAxisAlignment: MainAxisAlignment.end,
//          children: <Widget>[
//            TabBar(
//              tabs: [
//                Tab(text: 'タイムライン', icon: Icon(Icons.directions_transit)),
//                Tab(text: 'お気に入り', icon: Icon(Icons.directions_transit)),
//              ],
//            )
//          ],
//        ),
          ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return _tabcontroller;
  }

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        body: Center(
//      child: Text('this is list page'),
//    ));
//  }
}
