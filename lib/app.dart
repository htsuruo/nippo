import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nippo/pages/list.dart';
import 'package:nippo/pages/profile.dart';
import 'package:nippo/pages/setting.dart';
import 'package:nippo/pages/signin.dart';
import 'package:nippo/pages/user.dart';
import 'package:nippo/theme.dart';
import 'package:provider/provider.dart';

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

class BottomNavBarStore with ChangeNotifier {
  int _currentIndex = 0;
  void change({int index}) {
    _currentIndex = index;
    print('selected page is $_currentIndex');
    notifyListeners();
  }
}

class HomePage extends StatelessWidget {
  static final String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    print(args);
    return ChangeNotifierProvider<BottomNavBarStore>(
      create: (context) => BottomNavBarStore(),
      child: Scaffold(
        body: ContainerPage(),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}

class ContainerPage extends StatelessWidget {
  Widget _changePage({int page}) {
    var pageList = [ListPage(), UserPage(), ProfilePage()];
    return pageList[page];
  }

  @override
  Widget build(BuildContext context) {
    final tabIns = Provider.of<BottomNavBarStore>(context);
    return Container(
      child: _changePage(page: tabIns._currentIndex),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  List<BottomNavigationBarItem> bottomItems() {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.view_list), title: Text('日報')),
      BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('登録者')),
      BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('マイページ')),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavBarStore>(context);
    return BottomNavigationBar(
      onTap: (index) => provider.change(index: index),
      items: bottomItems(),
      currentIndex: provider._currentIndex,
      selectedFontSize: 12.0,
      elevation: 5.0,
      backgroundColor: Colors.white,
      unselectedItemColor: Color(0xFFCCCCCC),
    );
  }
}
