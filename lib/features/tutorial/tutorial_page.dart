import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:nippo/theme.dart';

import '../signin/sign_in_page.dart';
import 'tutorial_child.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});
  static const String routeName = '/tutorial';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverBoard(
        pages: tutorialPages(),
        skipText: 'スキップ',
        nextText: '次へ',
        finishText: 'はじめる',
        skipCallback: () {
          print('skipCallback');
          Navigator.of(context).pushReplacementNamed(SignInPage.routeName);
        },
        finishCallback: () {
          print('finishCallback');
          Navigator.of(context).pushReplacementNamed(SignInPage.routeName);
        },
      ),
    );
  }
}

List<PageModel> tutorialPages() {
  final pages = [
    PageModel.withChild(
      child: const TutorialChild(
        color: VIC.red,
        title: 'チュートリアル1です',
        description: 'チュートリアルのディスクリプションです',
      ),
      color: VIC.red,
    ),
    PageModel.withChild(
      child: const TutorialChild(
        color: VIC.yellow,
        title: 'チュートリアル2です',
        description: 'チュートリアルのディスクリプションです',
      ),
      color: VIC.yellow,
    ),
    PageModel.withChild(
      child: const TutorialChild(
        color: VIC.navy,
        title: 'チュートリアル3です',
        description: 'チュートリアルのディスクリプションです',
      ),
      color: VIC.navy,
    ),
    PageModel.withChild(
      child: const TutorialChild(
        color: VIC.green,
        title: 'チュートリアル4です',
        description: 'チュートリアルのディスクリプションです',
      ),
      color: VIC.green,
    ),
  ];
  return pages;
}
