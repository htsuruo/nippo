// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $shellRouteData,
      $signinPageRoute,
      $userPageRoute,
      $userPostPageRoute,
    ];

RouteBase get $shellRouteData => StatefulShellRouteData.$route(
      factory: $ShellRouteDataExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/posts',
              factory: $PostsPageRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: ':pid',
                  factory: $PostPageRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'create',
                  factory: $PostCreatePageRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'edit/:pid',
                  factory: $PostEditPageRouteExtension._fromState,
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/profile',
              factory: $ProfilePageRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'setting',
                  parentNavigatorKey: SettingPageRoute.$parentNavigatorKey,
                  factory: $SettingPageRouteExtension._fromState,
                ),
              ],
            ),
          ],
        ),
      ],
    );

extension $ShellRouteDataExtension on ShellRouteData {
  static ShellRouteData _fromState(GoRouterState state) =>
      const ShellRouteData();
}

extension $PostsPageRouteExtension on PostsPageRoute {
  static PostsPageRoute _fromState(GoRouterState state) =>
      const PostsPageRoute();

  String get location => GoRouteData.$location(
        '/posts',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PostPageRouteExtension on PostPageRoute {
  static PostPageRoute _fromState(GoRouterState state) => PostPageRoute(
        pid: state.pathParameters['pid']!,
      );

  String get location => GoRouteData.$location(
        '/posts/${Uri.encodeComponent(pid)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PostCreatePageRouteExtension on PostCreatePageRoute {
  static PostCreatePageRoute _fromState(GoRouterState state) =>
      PostCreatePageRoute();

  String get location => GoRouteData.$location(
        '/posts/create',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PostEditPageRouteExtension on PostEditPageRoute {
  static PostEditPageRoute _fromState(GoRouterState state) => PostEditPageRoute(
        pid: state.pathParameters['pid']!,
      );

  String get location => GoRouteData.$location(
        '/posts/edit/${Uri.encodeComponent(pid)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProfilePageRouteExtension on ProfilePageRoute {
  static ProfilePageRoute _fromState(GoRouterState state) =>
      const ProfilePageRoute();

  String get location => GoRouteData.$location(
        '/profile',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingPageRouteExtension on SettingPageRoute {
  static SettingPageRoute _fromState(GoRouterState state) => SettingPageRoute();

  String get location => GoRouteData.$location(
        '/profile/setting',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $signinPageRoute => GoRouteData.$route(
      path: '/signin',
      factory: $SigninPageRouteExtension._fromState,
    );

extension $SigninPageRouteExtension on SigninPageRoute {
  static SigninPageRoute _fromState(GoRouterState state) => SigninPageRoute();

  String get location => GoRouteData.$location(
        '/signin',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $userPageRoute => GoRouteData.$route(
      path: '/user/:uid',
      factory: $UserPageRouteExtension._fromState,
    );

extension $UserPageRouteExtension on UserPageRoute {
  static UserPageRoute _fromState(GoRouterState state) => UserPageRoute(
        uid: state.pathParameters['uid']!,
      );

  String get location => GoRouteData.$location(
        '/user/${Uri.encodeComponent(uid)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $userPostPageRoute => GoRouteData.$route(
      path: '/user/:uid/posts/:pid',
      factory: $UserPostPageRouteExtension._fromState,
    );

extension $UserPostPageRouteExtension on UserPostPageRoute {
  static UserPostPageRoute _fromState(GoRouterState state) => UserPostPageRoute(
        uid: state.pathParameters['uid']!,
        pid: state.pathParameters['pid']!,
      );

  String get location => GoRouteData.$location(
        '/user/${Uri.encodeComponent(uid)}/posts/${Uri.encodeComponent(pid)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routerHash() => r'cef1cfc671e64b65ca923f7bb1cce6a34fbe5c1e';

/// See also [router].
@ProviderFor(router)
final routerProvider = AutoDisposeProvider<GoRouter>.internal(
  router,
  name: r'routerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$routerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RouterRef = AutoDisposeProviderRef<GoRouter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
