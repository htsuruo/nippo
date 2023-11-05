// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $signinPageRoute,
      $settingPageRoute,
      $shellRouteData,
    ];

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

RouteBase get $settingPageRoute => GoRouteData.$route(
      path: '/setting',
      factory: $SettingPageRouteExtension._fromState,
    );

extension $SettingPageRouteExtension on SettingPageRoute {
  static SettingPageRoute _fromState(GoRouterState state) => SettingPageRoute();

  String get location => GoRouteData.$location(
        '/setting',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

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
                  path: 'create',
                  factory: $PostCreatePageRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: ':pid',
                  factory: $PostDetailPageRouteExtension._fromState,
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/user',
              factory: $UserPageRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: ':uid/posts/:pid',
                  factory: $UserPostPageRouteExtension._fromState,
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

extension $PostDetailPageRouteExtension on PostDetailPageRoute {
  static PostDetailPageRoute _fromState(GoRouterState state) =>
      PostDetailPageRoute(
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

extension $UserPageRouteExtension on UserPageRoute {
  static UserPageRoute _fromState(GoRouterState state) => UserPageRoute(
        uid: state.uri.queryParameters['uid']!,
      );

  String get location => GoRouteData.$location(
        '/user',
        queryParams: {
          'uid': uid,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

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

String _$rootNavigatorHash() => r'bf3a55396e6c7a536bad5970f01cdf155352c0db';

/// See also [rootNavigator].
@ProviderFor(rootNavigator)
final rootNavigatorProvider =
    AutoDisposeProvider<GlobalKey<NavigatorState>>.internal(
  rootNavigator,
  name: r'rootNavigatorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$rootNavigatorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RootNavigatorRef = AutoDisposeProviderRef<GlobalKey<NavigatorState>>;
String _$routerHash() => r'6cacf039171019443419e997b8478a32aff9a7ae';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
