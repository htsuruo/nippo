import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData.light().copyWith(
    primaryColor: _MyColors.theme[500], backgroundColor: Colors.white);

class _MyColors {
  _MyColors._(); // this basically makes it so you can instantiate this class
  static const Map<int, Color> theme = const <int, Color>{
    500: const Color(0xFF2D3047),
    600: const Color(0xFFF7B52C),
  };

//  static const Map<int, Color> accent = const <int, Color>{
//    500: const Color(0xFF00A7E1),
//  };
}
