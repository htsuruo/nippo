import 'package:flutter/material.dart';
import 'package:nippo/pages/home_list.dart';
import 'package:nippo/pages/profile.dart';
import 'package:nippo/pages/user.dart';
import 'package:nippo/states/bottom_nav_bar_state.dart';
import 'package:provider/provider.dart';
import 'package:nippo/components/templates/bubble_bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    print(args);
    return ChangeNotifierProvider<BottomNavBarState>(
      create: (context) => BottomNavBarState(),
      child: Scaffold(
        body: PageView(),
        bottomNavigationBar: BubbleBottomNavBar(),
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
    final tabIns = Provider.of<BottomNavBarState>(context);
    return Container(
      child: _currentPage(page: tabIns.currentIndex),
    );
  }
}
