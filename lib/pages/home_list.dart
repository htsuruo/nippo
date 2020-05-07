import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nippo/components/app_logo.dart';
import 'package:nippo/components/content_cart.dart';
import 'package:nippo/pages/create.dart';
import 'package:nippo/models/post.dart';

class HomeListPage extends StatelessWidget {
  final List<Tab> tabItems = <Tab>[
    const Tab(
      text: 'みんなの日報',
    ),
    const Tab(
      text: 'お気に入り',
    ),
  ];

  final Firestore firestore = Firestore.instance;

  Widget tabBarContainer({String tabText}) {
    if (tabText.toLowerCase().contains(tabItems[0].text)) {
      return FutureBuilder<QuerySnapshot>(
          future: firestore.collection('posts').getDocuments(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }
            if (snapshot.hasError) {
              return const Center(child: Text('エラーです'));
            }
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: Text('データを読込中..'));
              case ConnectionState.done:
                return ListView.builder(
                    itemCount: snapshot.data.documents.length as int,
                    itemBuilder: (context, index) {
                      final dynamic data = snapshot.data.documents[index];
                      final post = Post(
                        title: data['title'].toString(),
                        description: data['description'].toString(),
                        uid: 'xxxxx',
                      );
                      return ContentCard(post: post);
                    });
              default:
                return const Center(child: Text('hgohoge'));
            }
          });
    }
    if (tabText.toLowerCase().contains(tabItems[1].text)) {
      return Text('ｈのんげ');
//      return ListView.builder(itemBuilder: (BuildContext context, int index) {
//        return ContentCard(title: '$index', description: 'hoghge');
//      });
    }
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
//      elevation: 0,
      child: Icon(Icons.mode_edit),
      backgroundColor: const Color(0xFFE84855),
    );
  }
}
