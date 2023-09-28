import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nippo/features/post/post_list_page.dart';
import 'package:nippo/features/signin/signin_page.dart';
import 'package:nippo/features/user/profile/profile_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tsuruo_kit/tsuruo_kit.dart';

import 'core/authentication/auth_provider.dart';
import 'core/navigation/scaffold_with_navigation.dart';
import 'features/post/create/post_create_page.dart';
import 'features/setting/setting_page.dart';

part 'router.g.dart';

class _Location {
  _Location._();
  static const posts = '/posts';
  static const postCreate = '/create';
  static const signin = '/signin';
  static const profile = '/profile';
  static const setting = '/setting';
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
    initialLocation: _Location.posts,
    navigatorKey: ref.watch(rootNavigatorProvider),
    redirect: (context, state) async {
      final signedIn = await ref.watch(isSignedInProvider.future);
      final isSigninLocation = state.location == _Location.signin;
      if (!signedIn) {
        return isSigninLocation ? null : _Location.signin;
      }
      if (isSigninLocation || state.location == _Location.posts) {
        return _Location.posts;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: _Location.signin,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: _Root(child: SigninPage()),
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => _Root(
          child: ScaffoldWithNavigation(
            navigationShell: navigationShell,
          ),
        ),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: _Location.posts,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: PostListPage(),
                ),
                routes: [
                  GoRoute(
                    path: _Location.postCreate,
                    pageBuilder: (context, state) => const NoTransitionPage(
                      child: PostCreatePage(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: _Location.profile,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ProfilePage(),
                ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: _Location.setting,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SettingPage(),
        ),
      ),
    ],
  );
}

class _Root extends StatelessWidget {
  const _Root({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(child: child);
  }
}
