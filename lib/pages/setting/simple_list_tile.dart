import 'package:flutter/material.dart';

class SimpleListTile extends StatelessWidget {
  const SimpleListTile({@required this.title, this.trailing, this.onTap});
  final String title;
  final Widget trailing;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
