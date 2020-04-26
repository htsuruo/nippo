import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nippo/pages/list.dart';
import 'package:nippo/pages/profile.dart';
import 'package:nippo/pages/setting.dart';
import 'package:nippo/pages/signin.dart';
import 'package:nippo/pages/user.dart';
import 'package:nippo/theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NIPPO',
      theme: setTheme(context),
//      darkTheme: ThemeData.dark(), // これだけでダークモード的な事ができる.
      initialRoute: HomePage.routeName,
      routes: <String, WidgetBuilder>{
        HomePage.routeName: (context) => HomePage(),
        SignInPage.routeName: (context) => SignInPage(),
        UserPage.routeName: (context) => UserPage(),
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
//  ページインデックス保持する変数を宣言
  int _page = 0;

//  ボトムナビゲーションの一覧を宣言
  List<BottomNavigationBarItem> bottomItems() {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.view_list), title: Text('日報')),
      BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('登録者')),
      BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('マイページ')),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _page = index;
      print('this is $_page');
    });
  }

  Widget _changePage(int index) {
    switch (_page) {
      case 0:
        return ListPage();
      case 1:
        return UserPage();
      case 2:
        return ProfilePage();
      default:
        return ListPage();
    }
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
}
