import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'router.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFD74794)),
      useMaterial3: true,
      dividerTheme: const DividerThemeData(space: 0),
    );
    final listTextStyle = theme.textTheme.bodyMedium;

    return MaterialApp.router(
      title: 'nippo',
      routerConfig: ref.watch(routerProvider),
      theme: theme.copyWith(
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
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja'),
      ],
    );
  }
}
