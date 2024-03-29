import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tsuruo_kit/tsuruo_kit.dart';

import 'core/router/router.dart';
import 'core/theme/theme.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AdaptiveTheme(
      light: AppTheme.light,
      dark: AppTheme.dark,
      initial: AdaptiveThemeMode.system,
      builder: (light, dark) => MaterialApp.router(
        title: 'nippo',
        theme: light,
        darkTheme: dark,
        routerConfig: ref.watch(routerProvider),
        scaffoldMessengerKey: ref.watch(scaffoldMessengerKey),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ja'),
        ],
      ),
    );
  }
}
