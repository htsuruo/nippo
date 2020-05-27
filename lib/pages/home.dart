import 'package:flutter/material.dart';
import 'package:nippo/components/templates/bubble_bottom_nav_bar.dart';
import 'package:nippo/pages/home_list.dart';
import 'package:nippo/pages/profile.dart';
import 'package:nippo/pages/user.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage._({Key key}) : super(key: key);
  static const String routeName = '/home';

  static Widget wrapped() {
    return ChangeNotifierProvider<BottomNavBarState>(
      create: (context) => BottomNavBarState(),
      child: const HomePage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(),
      bottomNavigationBar: BubbleBottomNavBar(
        index: context.select((BottomNavBarState s) => s.currentIndex),
        onTap: (index) {
          context.read<BottomNavBarState>().change(index: index);
        },
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
    final tabIns = context.watch<BottomNavBarState>();
    return Container(
      child: _currentPage(page: tabIns.currentIndex),
    );
  }
}

class BottomNavBarState with ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  void change({int index}) {
    _currentIndex = index;
    print('selected page is $_currentIndex');
    notifyListeners();
  }
}
