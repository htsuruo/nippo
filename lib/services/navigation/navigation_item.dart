import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

enum NavigationItem {
  home(iconData: Icons.home),
  profile(iconData: Icons.person),
  ;

  const NavigationItem({required this.iconData});
  final IconData iconData;
  String get label => name.pascalCase;
}
