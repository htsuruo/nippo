import 'package:flutter/material.dart';

class SimpleListContainer extends StatelessWidget {
  const SimpleListContainer({@required this.title, this.trailing, this.onTap});
  final String title;
  final Widget trailing;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 14),
        ),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
