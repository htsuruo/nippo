import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nippo/features/post/detail/post_page.dart';
import 'package:nippo/features/post/form/post_form_page.dart';
import 'package:nippo/features/post/post_list_page.dart';
import 'package:nippo/features/setting/setting_page.dart';
import 'package:nippo/features/signin/signin_page.dart';
import 'package:nippo/features/user/user_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tsuruo_kit/tsuruo_kit.dart';

import '../authentication/auth_provider.dart';
import '../navigation/scaffold_with_navigation.dart';

part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

extension GoRouterX on GoRouter {
  NavigatorState get navigator => routerDelegate.navigatorKey.currentState!;
}

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    routes: $appRoutes,
    debugLogDiagnostics: kDebugMode,
    initialLocation: const PostsPageRoute().location,
    navigatorKey: _rootNavigatorKey,
    redirect: (context, state) async {
      final signedIn = await ref.watch(isSignedInProvider.future);
      final location = state.uri.toString();
      final isSigninLocation = location == SigninPageRoute().location;
      if (!signedIn) {
        return isSigninLocation ? null : SigninPageRoute().location;
      }
      if (isSigninLocation || location == const PostsPageRoute().location) {
        return const PostsPageRoute().location;
      }
      return null;
    },
  );
}

@TypedStatefulShellRoute<ShellRouteData>(
  branches: [
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<PostsPageRoute>(
          path: '/posts',
          // `:pid`を先頭にすると`create`がIDとして解釈されてしまいcreateページに遷移できなくなるので注意
          // ベタ指定されるパスを先に書く必要がある。
          routes: [
            TypedGoRoute<PostPageRoute>(
              // NOTE(htsuruo): 本来はZennのように`[uid]/posts/[pid]`のようなパスにしたいが、
              // StatefulShellBranchでは親ルートのpostsが頭にきてしまうため実現できなさそう？
              // PostのドキュメントIDを取得するためにはコレクショングループで引くしかない。
              path: ':pid',
            ),
            TypedGoRoute<PostCreatePageRoute>(
              path: 'create',
            ),
            TypedGoRoute<PostEditPageRoute>(
              path: 'edit/:pid',
            ),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<ProfilePageRoute>(
          path: '/profile',
          routes: [
            TypedGoRoute<SettingPageRoute>(
              path: 'setting',
            ),
          ],
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

@TypedGoRoute<SigninPageRoute>(path: '/signin')
class SigninPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const _Root(child: SigninPage());
}

class PostsPageRoute extends GoRouteData {
  const PostsPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PostListPage();
  }
}

class PostPageRoute extends GoRouteData {
  const PostPageRoute({required this.pid});

  final String pid;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PostPage.fromAll(pid: pid);
  }
}

class PostCreatePageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const PostFormPage.create();
}

class PostEditPageRoute extends GoRouteData {
  const PostEditPageRoute({required this.pid});
  final String pid;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      PostFormPage.edit(postId: pid);
}

class ProfilePageRoute extends GoRouteData {
  const ProfilePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const UserPage.me();
  }
}

class SettingPageRoute extends GoRouteData {
  // ref. https://github.com/flutter/packages/tree/main/packages/go_router_builder#typedshellroute-and-navigator-keys
  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      const MaterialPage(
        fullscreenDialog: true,
        child: SettingPage(),
      );
}

@TypedGoRoute<UserPageRoute>(path: '/user/:uid')
class UserPageRoute extends GoRouteData {
  const UserPageRoute({required this.uid});

  final String uid;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      MaterialPage(
        child: _Root(child: UserPage.uid(uid)),
      );
}

@TypedGoRoute<UserPostPageRoute>(path: '/user/:uid/posts/:pid')
class UserPostPageRoute extends GoRouteData {
  const UserPostPageRoute({required this.uid, required this.pid});

  final String uid;
  final String pid;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PostPage.fromProfile(uid: uid, pid: pid);
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
