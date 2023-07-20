import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nippo/features/profile/profile_page.dart';
import 'package:nippo/features/signin/signin_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'fir_user_provider.dart';
import 'services/navigation/scaffold_with_navigation.dart';

part 'router.g.dart';

class _Location {
  _Location._();
  static const _initial = '/';
  static const signin = '/signin';
}

@riverpod
GlobalKey<NavigatorState> rootNavigator(RootNavigatorRef ref) =>
    GlobalKey<NavigatorState>(debugLabel: 'root');

extension GoRouterX on GoRouter {
  NavigatorState get navigator => routerDelegate.navigatorKey.currentState!;
}

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: _Location._initial,
    navigatorKey: ref.watch(rootNavigatorProvider),
    redirect: (context, state) async {
      final signedIn = await ref.watch(isSignedInProvider.future);
      final isSigninLocation = state.location == _Location.signin;
      if (!signedIn) {
        return isSigninLocation ? null : _Location.signin;
      }
      if (isSigninLocation || state.location == _Location._initial) {
        return _Location._initial;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: _Location.signin,
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
                path: _Location._initial,
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
}
