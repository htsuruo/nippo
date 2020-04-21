import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nippo/page/list.dart';
import 'package:nippo/page/mypage.dart';
import 'package:nippo/theme.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NIPPO',
      theme: themeData,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//  ページ切り替え用のコントローラを宣言
  PageController _pageController;

//  ページインデックス保持する変数を宣言
  int _page = 0;

//  ボトムナビゲーションの一覧を宣言
  List<BottomNavigationBarItem> bottomItems() {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.view_list), title: Text('日報')),
      BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('マイページ')),
    ];
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _page, // 初期ページの設定
    );
  }

  @override
  void dispose() {
    super.dispose();
    // コントローラ破棄
    _pageController.dispose();
  }

//  ロゴアイコンの宣言
  Image appLogo = new Image(
    image: new ExactAssetImage('assets/img/ic_main_logo.png'),
    height: 44.0,
    alignment: FractionalOffset.center,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appLogo,
//        leading: Icon(Icons.notifications, color: Colors.grey),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: new PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          ListPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
//        現在のページインデックス
        currentIndex: _page,
        onTap: onTapBottomNavigation,
        items: bottomItems(),
        selectedFontSize: 12.0,
        elevation: 4.0,
      ),
    );
  }

  void onTapBottomNavigation(int page) {
//    _pageController.animateToPage(page,
//        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    _pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
