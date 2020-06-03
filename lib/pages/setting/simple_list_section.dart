import 'package:flutter/material.dart';

class SimpleListSection extends StatelessWidget {
  const SimpleListSection({@required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 48, left: 16, right: 16, bottom: 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}
