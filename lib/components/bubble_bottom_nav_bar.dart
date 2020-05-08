import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:provider/provider.dart';
import 'package:nippo/states/bottom_nav_bar_state.dart';

class BubbleBottomNavBar extends StatelessWidget {
  List<BubbleBottomBarItem> bottomItems() {
    return [
      BubbleBottomBarItem(
          backgroundColor: const Color(0xFFE84855),
          icon: Icon(
            Icons.view_list,
            color: const Color(0xFFCCCCCC),
          ),
          activeIcon: Icon(
            Icons.view_list,
            color: const Color(0xFFE84855),
          ),
          title: const Text('日報')),
      BubbleBottomBarItem(
          backgroundColor: const Color(0xFF1B998B),
          icon: Icon(
            Icons.people,
            color: const Color(0xFFCCCCCC),
          ),
          activeIcon: Icon(
            Icons.people,
            color: const Color(0xFF1B998B),
          ),
          title: const Text('登録者')),
      BubbleBottomBarItem(
          backgroundColor: const Color(0xFF2D3047),
          icon: Icon(
            Icons.person,
            color: const Color(0xFFCCCCCC),
          ),
          activeIcon: Icon(
            Icons.person,
            color: const Color(0xFF2D3047),
          ),
          title: const Text('マイページ')),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavBarState>(context);
    return BubbleBottomBar(
      opacity: .2,
      hasNotch: true,
      hasInk: true,
      onTap: (index) => provider.change(index: index),
      items: bottomItems(),
      currentIndex: provider.currentIndex,
//      selectedFontSize: 12,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      elevation: 5,
      backgroundColor: Colors.white,
//      unselectedItemColor: const Color(0xFFCCCCCC),
    );
  }
}
