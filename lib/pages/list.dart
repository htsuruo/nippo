import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nippo/app.dart';

class ListPage extends StatelessWidget {
  final List<Tab> tabItems = <Tab>[
    Tab(
      text: '全体',
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
            return tabBarContainer(tabText: tab.text);
          }).toList(),
        )),
      ),
    );
  }
}

class ContentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, left: 16, right: 16),
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.black12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: CircleAvatar(
                radius: 24.0,
                backgroundColor: Colors.lightBlueAccent,
              )),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: 16, left: 4, right: 4),
                    child: Text(
                      'タイトルタイトルタイトルタイトルタイトル',
                      softWrap: true,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DefaultTextStyle(
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 16.0, left: 4, right: 4),
                    child: Text(
                        '関係者によりますと、東京都内で２７日、新たに３９人が新型コロナウイルスに感染していたことが分かりました。これは先月３０日以来の低い水準です。'),
                  ),
                )
              ],
              mainAxisSize: MainAxisSize.min,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Icon(
              Icons.favorite_border,
              color: Color(0xFFE84855),
              size: 28.0,
            ),
          ),
        ],
      ),
    );
  }
}
