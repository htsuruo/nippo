import 'package:flutter/material.dart';
import 'package:nippo/components/app_logo.dart';
import 'package:nippo/components/content_cart.dart';
import 'package:nippo/pages/create.dart';

class HomeListPage extends StatelessWidget {
  final List<Tab> tabItems = <Tab>[
    const Tab(
      text: 'みんなの日報',
    ),
    const Tab(
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
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabItems.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const AppLogo(height: 50),
          bottom: TabBar(
            tabs: tabItems,
            indicatorColor: const Color(0xFF2D3047),
            labelColor: const Color(0xFF2D3047),
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelColor: const Color(0xFFAAAAAA),
          ),
        ),
        body: SafeArea(
            child: TabBarView(
          children: tabItems.map((tab) {
            return tabBarContainer(tabText: tab.text);
          }).toList(),
        )),
        floatingActionButton: FAB(),
      ),
    );
  }
}

class FAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute<MaterialPageRoute>(
              builder: (BuildContext context) {
                return CreatePage();
              },
              fullscreenDialog: true,
            ));
      },
      elevation: 0,
      child: Icon(Icons.mode_edit),
      backgroundColor: const Color(0xFFE84855),
    );
  }
}
