import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:nippo/components/tutorial_child.dart';
import 'package:nippo/pages/signin.dart';

class TutorialPage extends StatelessWidget {
  static const String routeName = '/tutorial';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverBoard(
        pages: tutorialPages(),
        showBullets: true,
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
        child: TutorialChild(
          color: const Color(0xFFE84855),
          title: 'チュートリアル1です',
          description: 'チュートリアルのディスクリプションです',
        ),
        color: const Color(0xFFE84855),
        doAnimateChild: false),
    PageModel.withChild(
        child: TutorialChild(
          color: const Color(0xFFF2D163),
          title: 'チュートリアル2です',
          description: 'チュートリアルのディスクリプションです',
        ),
        color: const Color(0xFFF2D163),
        doAnimateChild: false),
    PageModel.withChild(
        child: TutorialChild(
          color: const Color(0xFF2D3047),
          title: 'チュートリアル3です',
          description: 'チュートリアルのディスクリプションです',
        ),
        color: const Color(0xFF2D3047),
        doAnimateChild: false),
    PageModel.withChild(
        child: TutorialChild(
          color: const Color(0xFF1B998B),
          title: 'チュートリアル4です',
          description: 'チュートリアルのディスクリプションです',
        ),
        color: const Color(0xFF1B998B),
        doAnimateChild: false),
  ];
  return pages;
}
