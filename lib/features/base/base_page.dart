import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:nippo/common/common.dart';
import 'package:nippo/features/profile/profile_page.dart';
import 'package:provider/provider.dart';

import '../../core/auth_controller.dart';
import '../post/post_list_page.dart';
import '../user/user_list_page.dart';

class BasePage extends StatelessWidget {
  const BasePage._();
  static const String routeName = '/home';

  static Widget wrapped() {
    return StateNotifierProvider<BottomNavigationBarController, int>(
      create: (context) => BottomNavigationBarController(),
      child: const BasePage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<AuthController>().updateData();
    return Scaffold(
      body: const PageView(),
      bottomNavigationBar: BottomNavBar(
        index: context.select((int currentIndex) => currentIndex),
        onTap: (index) {
          context.read<BottomNavigationBarController>().change(index: index);
        },
      ),
    );
  }
}

class PageView extends StatelessWidget {
  const PageView({super.key});

  Widget _currentPage({required int page}) {
    final pageList = [
      const PostListPage(),
      const UserPage(),
      const ProfilePage(),
    ];
    return pageList[page];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _currentPage(
        page: context.select((int currentIndex) => currentIndex),
      ),
    );
  }
}

class BottomNavigationBarController extends StateNotifier<int> {
  BottomNavigationBarController() : super(0);
  void change({required int index}) {
    state = index;
    print('change to bottomNavIndex: $index');
  }
}
