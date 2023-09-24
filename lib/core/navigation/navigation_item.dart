import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

enum NavigationItem {
  timeline(iconData: Icons.view_timeline_outlined),
  profile(iconData: Icons.person_outline),
  ;

  const NavigationItem({required this.iconData});
  final IconData iconData;
  String get label => name.pascalCase;
}
