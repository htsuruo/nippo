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

class _Location {
  _Location._();
  static const posts = '/posts';

  // REVIEW(htsuruo): 本来はZennのように`[uid]/posts/[pid]`のようなパスにしたいが、
  // StatefulShellBranchでは親ルートのpostsが頭にきてしまうため実現できなさそう？
  // PostのドキュメントIDを取得するためにはコレクショングループで引くしかない。
  static const post = ':pid';
  static const postCreate = 'create';
  static const postEdit = 'edit/:pid';
  static const signin = '/signin';
  static const user = '/user/:uid';
  static const userPost = '/user/:uid/posts/:pid';
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
      final location = state.uri.toString();
      final isSigninLocation = location == _Location.signin;
      if (!signedIn) {
        return isSigninLocation ? null : _Location.signin;
      }
      if (isSigninLocation || location == _Location.posts) {
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

@TypedGoRoute<UserPageRoute>(path: _Location.user)
class UserPageRoute extends GoRouteData {
  const UserPageRoute({required this.uid});

  final String uid;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      MaterialPage(
        child: _Root(child: UserPage.uid(uid)),
      );
}

@TypedGoRoute<UserPostPageRoute>(path: _Location.userPost)
class UserPostPageRoute extends GoRouteData {
  const UserPostPageRoute({required this.uid, required this.pid});

  final String uid;
  final String pid;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PostPage.fromProfile(uid: uid, pid: pid);
  }
}

@TypedStatefulShellRoute<ShellRouteData>(
  branches: [
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<PostsPageRoute>(
          path: _Location.posts,
          // `:pid`を先頭にすると`create`がIDとして解釈されてしまいcreateページに遷移できなくなるので注意
          // ベタ指定されるパスを先に書く必要がある。
          routes: [
            TypedGoRoute<PostCreatePageRoute>(
              path: _Location.postCreate,
            ),
            TypedGoRoute<PostEditPageRoute>(
              path: _Location.postEdit,
            ),
            TypedGoRoute<PostDetailPageRoute>(
              path: _Location.post,
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
  const PostDetailPageRoute({required this.pid});

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
