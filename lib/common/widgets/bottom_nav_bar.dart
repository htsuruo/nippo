import 'package:flutter/material.dart';
import 'package:nippo/theme.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.index,
    required this.onTap,
  });

  final int index;
  final ValueChanged<int>? onTap;

  List<BottomNavigationBarItem> bottomItems() {
    return [
      const BottomNavigationBarItem(
        icon: Icon(Icons.view_list),
        label: '日報',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.people),
        label: '登録者',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'マイページ',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      items: bottomItems(),
      currentIndex: index,
      selectedFontSize: 12,
      elevation: 5,
      backgroundColor: Colors.white,
      unselectedItemColor: VIC.navigationUnselected,
    );
  }
}
