import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nippo/pages/list.dart';
import 'package:nippo/pages/profile.dart';
import 'package:nippo/pages/setting.dart';
import 'package:nippo/pages/signin.dart';
import 'package:nippo/pages/splash.dart';
import 'package:nippo/pages/user.dart';
import 'package:nippo/theme.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProgressHUDState>(
      create: (context) => ProgressHUDState(),
      child: MaterialApp(
        title: 'NIPPO',
        theme: setTheme(context),
//      darkTheme: ThemeData.dark(), // これだけでダークモード的な事ができる.
        initialRoute: SplashPage.routeName,
        routes: <String, WidgetBuilder>{
          SplashPage.routeName: (context) => SplashPage(),
          HomePage.routeName: (context) => HomePage(),
          SignInPage.routeName: (context) => SignInPage(),
          UserPage.routeName: (context) => UserPage(),
          SettingPage.routeName: (context) => SettingPage(),
        },
      ),
    );
  }
}

class BottomNavBarStore with ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
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
        floatingActionButton: FAB(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

class FAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Provider.of<BottomNavBarStore>(context, listen: false).change(index: 1);
      },
      elevation: 0.0,
      child: Icon(Icons.mode_edit),
      backgroundColor: Color(0xFFE84855),
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
      child: _changePage(page: tabIns.currentIndex),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  List<BottomNavigationBarItem> bottomItems() {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.view_list), title: Text('日報')),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.people,
            color: Colors.white,
          ),
          title: Text(
            '日報を書く',
            style: TextStyle(
                color: Color(0xFFE84855), fontWeight: FontWeight.bold),
          )),
      BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('マイページ')),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavBarStore>(context);
    return BottomNavigationBar(
      onTap: (index) => provider.change(index: index),
      items: bottomItems(),
      currentIndex: provider.currentIndex,
      selectedFontSize: 12.0,
      elevation: 5.0,
      backgroundColor: Colors.white,
      unselectedItemColor: Color(0xFFCCCCCC),
    );
  }
}
