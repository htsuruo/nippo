import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:nippo/theme.dart';

class BubbleBottomNavBar extends StatelessWidget {
  const BubbleBottomNavBar({this.index, this.onTap});
  final int index;
  final Function(int) onTap;

  List<BubbleBottomBarItem> bottomItems() {
    return [
      BubbleBottomBarItem(
          backgroundColor: VIC.red,
          icon: Icon(
            Icons.view_list,
            color: const Color(0xFFCCCCCC),
          ),
          activeIcon: Icon(
            Icons.view_list,
            color: VIC.red,
          ),
          title: const Text('日報')),
      BubbleBottomBarItem(
          backgroundColor: VIC.green,
          icon: Icon(
            Icons.people,
            color: const Color(0xFFCCCCCC),
          ),
          activeIcon: Icon(
            Icons.people,
            color: VIC.green,
          ),
          title: const Text('登録者')),
      BubbleBottomBarItem(
          backgroundColor: VIC.navy,
          icon: Icon(
            Icons.person,
            color: const Color(0xFFCCCCCC),
          ),
          activeIcon: Icon(
            Icons.person,
            color: VIC.navy,
          ),
          title: const Text('マイページ')),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BubbleBottomBar(
      opacity: .2,
      hasNotch: true,
      hasInk: true,
      onTap: onTap,
      items: bottomItems(),
      currentIndex: index,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      elevation: 5,
      backgroundColor: Colors.white,
    );
  }
}
