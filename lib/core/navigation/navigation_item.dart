import 'package:flutter/material.dart';

enum NavigationItem {
  timeline(iconData: Icons.view_timeline_outlined, label: 'みんなの日報'),
  profile(iconData: Icons.person_outline, label: 'プロフィール'),
  ;

  const NavigationItem({required this.iconData, required this.label});
  final IconData iconData;
  final String label;
}
