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
