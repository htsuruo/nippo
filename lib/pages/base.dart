import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:nippo/components/templates/bubble_bottom_nav_bar.dart';
import 'package:nippo/pages/post/list.dart';
import 'package:nippo/pages/profile/profile.dart';
import 'package:nippo/pages/user/list.dart';
import 'package:provider/provider.dart';
import 'package:state_notifier/state_notifier.dart';

class BasePage extends StatelessWidget {
  const BasePage._({Key key}) : super(key: key);
  static const String routeName = '/home';

  static Widget wrapped() {
    return StateNotifierProvider<BottomNavBarController, int>(
      create: (context) => BottomNavBarController(),
      child: const BasePage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(),
      bottomNavigationBar: BubbleBottomNavBar(
        index: context.select((BottomNavBarController s) => s.currentIndex),
        onTap: (index) {
          context.read<BottomNavBarController>().currentIndex = index;
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
    return Container(
      child: _currentPage(
          page: context.select((BottomNavBarController s) => s.currentIndex)),
    );
  }
}

class BottomNavBarController extends StateNotifier<int> {
  BottomNavBarController() : super(0);
  int get currentIndex => state;
  set currentIndex(int index) => index;
}
