import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => _themeData(Brightness.light);
  static ThemeData get dark => _themeData(Brightness.dark);

  static ThemeData _themeData(Brightness brightness) {
    final themeData = ThemeData.from(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        brightness: brightness,
        seedColor: Colors.deepPurple,
      ),
    );
    final listTextStyle = themeData.textTheme.bodyMedium;

    return themeData.copyWith(
      splashFactory: InkSparkle.splashFactory,
      textTheme: themeData.textTheme.apply(
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      dividerTheme: const DividerThemeData(space: 0),
      listTileTheme: ListTileThemeData(
        titleTextStyle: listTextStyle,
        leadingAndTrailingTextStyle: listTextStyle,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        contentPadding: EdgeInsets.all(12),
        alignLabelWithHint: true,
      ),
    );
  }
}
