import 'package:flutter/material.dart';
import 'package:nippo/pages/create.dart';
import 'package:nippo/pages/home_list.dart';
import 'package:nippo/pages/profile.dart';
import 'package:nippo/pages/user.dart';
import 'package:nippo/stores/bottom_nav_bar_store.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    print(args);
    return ChangeNotifierProvider<BottomNavBarStore>(
      create: (context) => BottomNavBarStore(),
      child: Scaffold(
        body: PageView(),
        bottomNavigationBar: BottomNavBar(),
//        floatingActionButton: FAB(),
//        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

class PageView extends StatelessWidget {
  Widget _currentPage({int page}) {
    final pageList = [HomeListPage(), UserPage(), ProfilePage()];
    return pageList[page];
  }

  @override
  Widget build(BuildContext context) {
    final tabIns = Provider.of<BottomNavBarStore>(context);
    return Container(
      child: _currentPage(page: tabIns.currentIndex),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  List<BottomNavigationBarItem> bottomItems() {
    return [
      BottomNavigationBarItem(
          icon: Icon(Icons.view_list), title: const Text('日報')),
      BottomNavigationBarItem(
          icon: Icon(Icons.people), title: const Text('登録者')),
      BottomNavigationBarItem(
          icon: Icon(Icons.person), title: const Text('マイページ')),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavBarStore>(context);
    return BottomNavigationBar(
      onTap: (index) => provider.change(index: index),
      items: bottomItems(),
      currentIndex: provider.currentIndex,
      selectedFontSize: 12,
      elevation: 5,
      backgroundColor: Colors.white,
      unselectedItemColor: const Color(0xFFCCCCCC),
    );
  }
}
