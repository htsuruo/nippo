import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => _themeData(Brightness.light);
  static ThemeData get dark => _themeData(Brightness.dark);

  static ThemeData _themeData(Brightness brightness) {
    // デフォルトの`deepPurple`指定であれば`ThemeData.light`のコンストラクタ指定で十分だが
    // テンプレート利用時に`seedColor`を変更しやすいように`fromSeed`で書いておく
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
      // `ThemeData.from`で生成されるTextThemeに対してapplyしたいので`copyWith`で繋げない
      textTheme: themeData.textTheme.apply(
        fontFamily: GoogleFonts.poppins().fontFamily,
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
