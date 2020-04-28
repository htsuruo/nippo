import 'package:flutter/material.dart';
import 'package:nippo/components/app_logo.dart';
import 'package:nippo/components/content_cart.dart';

class HomeListPage extends StatelessWidget {
  final List<Tab> tabItems = <Tab>[
    Tab(
      text: 'みんなの日報',
    ),
    Tab(
      text: 'お気に入り',
    ),
  ];

  Widget tabBarContainer({String tabText}) {
    if (tabText.toLowerCase().contains(tabItems[0].text)) {
      return ListView.builder(
        itemBuilder: (_, index) {
          return ContentCard();
        },
        itemCount: 10,
      );
    }
    if (tabText.toLowerCase().contains(tabItems[1].text)) {
      return ListView.builder(
        itemBuilder: (_, index) {
          return ContentCard();
        },
        itemCount: 3,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabItems.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: AppLogo(height: 50),
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
            return tabBarContainer(tabText: tab.text);
          }).toList(),
        )),
      ),
    );
  }
}
