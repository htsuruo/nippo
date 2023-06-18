import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData setTheme(BuildContext context) {
  return ThemeData.from(
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      secondary: VIC.red,
      onSecondary: Colors.white,
    ),
    textTheme: GoogleFonts.notoSansTextTheme(Theme.of(context).textTheme),
  ).copyWith(
    appBarTheme: const AppBarTheme(
      elevation: 0.5,
      toolbarTextStyle: TextTheme(
        titleLarge: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ).bodyMedium,
      titleTextStyle: TextTheme(
        titleLarge: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ).titleLarge,
    ),
    dividerTheme:
        const DividerThemeData(color: Colors.black26, thickness: 0, space: 2),
  );
}

// Visual Identity Color.
class VIC {
  static const navy = Color(0xFF2D3047);
  static const red = Color(0xFFE84855);
  static const yellow = Color(0xFFF7B52C);
  static const green = Color(0xFF1B998B);
  static const border = Color(0xFFDDDDDD);
  static const navigationUnselected = Color(0xFFCCCCCC);
}
