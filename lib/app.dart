import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nippo/page/list.dart';
import 'package:nippo/page/profile.dart';
import 'package:nippo/page/setting.dart';
import 'package:nippo/page/signin.dart';
import 'package:nippo/theme.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NIPPO',
      theme: themeData,
      initialRoute: SignInPage.routeName,
      routes: <String, WidgetBuilder>{
        HomePage.routeName: (context) => HomePage(),
        SignInPage.routeName: (context) => SignInPage(),
        SettingPage.routeName: (context) => SettingPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  static final String routeName = '/home';
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  ページ切り替え用のコントローラを宣言
//  PageController _pageController;

//  ページインデックス保持する変数を宣言
  int _page = 0;

//  ボトムナビゲーションの一覧を宣言
  List<BottomNavigationBarItem> bottomItems() {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.view_list), title: Text('日報')),
      BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('マイページ')),
    ];
  }

//  @override
//  void initState() {
//    super.initState();
//    _pageController = PageController(
//      initialPage: _page, // 初期ページの設定
//    );
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//    // コントローラ破棄
//    _pageController.dispose();
//  }

  void _onItemTapped(int index) {
    setState(() {
      _page = index;
      print('this is $_page');
    });
  }

  Widget _changePage(int index) {
    return _page == 0 ? ListPage() : ProfilePage();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    print(args);
    return Scaffold(
      body: Container(
        child: _changePage(_page),
      ),
      bottomNavigationBar: BottomNavigationBar(
//        現在のページインデックス
        onTap: _onItemTapped,
        items: bottomItems(),
        currentIndex: _page,
        selectedFontSize: 12.0,
        elevation: 4.0,
        unselectedItemColor: Color(0xFFCCCCCC),
      ),
    );
  }

//  void onTapBottomNavigation(int page) {
//    _pageController.animateToPage(page,
//        duration: const Duration(milliseconds: 300), curve: Curves.ease);
//  }

//  void onPageChanged(int page) {
//    setState(() {
//      this._page = page;
//    });
//  }
}
