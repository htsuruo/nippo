import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:nippo/pages/auth/sign_in_page.dart';
import 'package:nippo/pages/tutorial/tutorial_child.dart';
import 'package:nippo/theme.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({Key key}) : super(key: key);
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
          color: VIC.red,
          title: 'チュートリアル1です',
          description: 'チュートリアルのディスクリプションです',
        ),
        color: VIC.red,
        doAnimateChild: false),
    PageModel.withChild(
        child: TutorialChild(
          color: VIC.yellow,
          title: 'チュートリアル2です',
          description: 'チュートリアルのディスクリプションです',
        ),
        color: VIC.yellow,
        doAnimateChild: false),
    PageModel.withChild(
        child: TutorialChild(
          color: VIC.navy,
          title: 'チュートリアル3です',
          description: 'チュートリアルのディスクリプションです',
        ),
        color: VIC.navy,
        doAnimateChild: false),
    PageModel.withChild(
        child: TutorialChild(
          color: VIC.green,
          title: 'チュートリアル4です',
          description: 'チュートリアルのディスクリプションです',
        ),
        color: VIC.green,
        doAnimateChild: false),
  ];
  return pages;
}
