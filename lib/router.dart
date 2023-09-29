import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nippo/features/post/post_list_page.dart';
import 'package:nippo/features/setting/setting_page.dart';
import 'package:nippo/features/signin/signin_page.dart';
import 'package:nippo/features/user/profile/profile_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tsuruo_kit/tsuruo_kit.dart';

import 'core/authentication/auth_provider.dart';
import 'core/navigation/scaffold_with_navigation.dart';
import 'features/post/create/post_create_page.dart';

part 'router.g.dart';

class _Location {
  _Location._();
  static const posts = '/posts';
  static const post = ':postId';
  static const postCreate = 'create';
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
    routes: $appRoutes,
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
  );
}

@TypedGoRoute<SigninPageRoute>(path: _Location.signin)
class SigninPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const _Root(child: SigninPage());
}

@TypedGoRoute<SettingPageRoute>(path: _Location.setting)
class SettingPageRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      const MaterialPage(
        fullscreenDialog: true,
        child: _Root(child: SettingPage()),
      );
}

@TypedStatefulShellRoute<ShellRouteData>(
  branches: [
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<PostsPageRoute>(
          path: _Location.posts,
          routes: [
            TypedGoRoute<PostDetailPageRoute>(
              path: _Location.post,
            ),
            TypedGoRoute<PostCreatePageRoute>(
              path: _Location.postCreate,
            ),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<ProfilePageRoute>(
          path: _Location.profile,
        ),
      ],
    ),
  ],
)
class ShellRouteData extends StatefulShellRouteData {
  const ShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return _Root(
      child: ScaffoldWithNavigation(
        navigationShell: navigationShell,
      ),
    );
  }
}

class _Root extends StatelessWidget {
  const _Root({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(child: child);
  }
}

class PostsPageRoute extends GoRouteData {
  const PostsPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PostListPage();
  }
}

class PostDetailPageRoute extends GoRouteData {
  const PostDetailPageRoute({required this.postId});

  final String postId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    // TODO(tsuruoka):
    return const PostCreatePage();
  }
}

class PostCreatePageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const _Root(child: PostCreatePage());
}

class ProfilePageRoute extends GoRouteData {
  const ProfilePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProfilePage();
  }
}
