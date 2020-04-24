import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  final List<Tab> tabItems = <Tab>[
    Tab(
      text: 'タイムライン',
    ),
    Tab(
      text: 'お気に入り',
    ),
  ];

  Image appLogo = new Image(
    image: ExactAssetImage('assets/img/ic_main_logo.png'),
    height: 50.0,
    alignment: FractionalOffset.center,
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabItems.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: appLogo,
          bottom: TabBar(
            tabs: tabItems,
            indicatorColor: Color(0xFF2D3047),
            labelColor: Color(0xFF2D3047),
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelColor: Color(0xFFAAAAAA),
          ),
        ),
        body: SafeArea(
            child: TabBarView(
          children: tabItems.map((tab) {
            final String label = tab.text.toLowerCase();
            return Center(
              child: Text('this is the $label tab'),
            );
          }).toList(),
        )),
      ),
    );
  }
}
