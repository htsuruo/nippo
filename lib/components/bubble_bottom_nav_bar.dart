import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:nippo/theme.dart';

class BubbleBottomNavBar extends StatelessWidget {
  const BubbleBottomNavBar({
    super.key,
    required this.index,
    required this.onTap,
  });
  final int index;
  final ValueChanged<int?>? onTap;

  List<BubbleBottomBarItem> bottomItems() {
    return [
      const BubbleBottomBarItem(
        backgroundColor: VIC.red,
        icon: Icon(
          Icons.view_list,
          color: VIC.navigationUnselected,
        ),
        activeIcon: Icon(
          Icons.view_list,
          color: VIC.red,
        ),
        title: Text('日報'),
      ),
      const BubbleBottomBarItem(
        backgroundColor: VIC.green,
        icon: Icon(
          Icons.people,
          color: VIC.navigationUnselected,
        ),
        activeIcon: Icon(
          Icons.people,
          color: VIC.green,
        ),
        title: Text('登録者'),
      ),
      const BubbleBottomBarItem(
        backgroundColor: VIC.navy,
        icon: Icon(
          Icons.person,
          color: VIC.navigationUnselected,
        ),
        activeIcon: Icon(
          Icons.person,
          color: VIC.navy,
        ),
        title: Text('マイページ'),
      ),
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
