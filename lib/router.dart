import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nippo/features/profile/profile_page.dart';
import 'package:nippo/features/signin/signin_page.dart';

import 'services/navigation/scaffold_with_navigation.dart';

final router = GoRouter(
  debugLogDiagnostics: kDebugMode,
  initialLocation: '/',
  redirect: (context, state) {
    // TODO(tsuruoka): 認証分岐
    return '/signin';
  },
  routes: [
    GoRoute(
      path: '/signin',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: SigninPage(),
      ),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => ScaffoldWithNavigation(
        navigationShell: navigationShell,
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: Scaffold(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ProfilePage(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
