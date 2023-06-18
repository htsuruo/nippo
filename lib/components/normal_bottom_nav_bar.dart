import 'package:flutter/material.dart';
import 'package:nippo/theme.dart';

class NormalBottomNavBar extends StatelessWidget {
  const NormalBottomNavBar({super.key, this.index, this.onTap});
  final int index;
  final Function(int) onTap;
  List<BottomNavigationBarItem> bottomItems() {
    return [
      const BottomNavigationBarItem(
        icon: Icon(Icons.view_list),
        label: Text('日報'),
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.people),
        label: Text('登録者'),
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: Text('マイページ'),
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
