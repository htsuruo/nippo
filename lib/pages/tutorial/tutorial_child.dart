import 'package:flutter/material.dart';

class TutorialChild extends StatelessWidget {
  TutorialChild(
      {this.color = Colors.white, this.title = '', this.description = ''});

  final Color color;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: SafeArea(
        top: false,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Center(
                    child: Image.asset(
                      'assets/img/ic_tutorial_line.png',
                      width: 60,
                      color: color,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(title,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 22)),
                  const SizedBox(height: 16),
                  Text(description,
                      style: const TextStyle(color: Colors.white, fontSize: 16))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
