import 'package:flutter/material.dart';

import 'router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'NIPPO',
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFD74794)),
        useMaterial3: true,
        dividerTheme: const DividerThemeData(space: 0),
      ),
    );
  }
}
