import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:nippo/features/post/post_repository.dart';
import 'package:nippo/features/user/user_repository.dart';
import 'package:nippo/services/auth_repository.dart';
import 'package:provider/provider.dart';

import 'features/base/base_page.dart';
import 'features/post/post_controller.dart';
import 'features/post/post_state.dart';
import 'features/setting/setting_page.dart';
import 'features/signin/register_page.dart';
import 'features/signin/sign_in_email_page.dart';
import 'features/signin/sign_in_page.dart';
import 'features/splash_page.dart';
import 'features/tutorial/tutorial_page.dart';
import 'features/user/user_controller.dart';
import 'features/user/user_detail_page.dart';
import 'features/user/user_state.dart';
import 'services/auth_controller.dart';
import 'services/auth_state.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => AuthRepository(),
        ),
        Provider(
          create: (context) => PostRepository(),
        ),
        Provider(
          create: (context) => UserRepository(),
        ),
        StateNotifierProvider<AuthController, AuthState>(
          create: (context) => AuthController(),
        ),
        StateNotifierProvider<PostController, PostState>(
          create: (context) => PostController(),
        ),
        StateNotifierProvider<UserController, UserState>(
          create: (context) => UserController(),
        ),
      ],
      child: MaterialApp(
        title: 'NIPPO',
        theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        ),
//      darkTheme: ThemeData.dark(), // これだけでダークモード的な事ができる.
        initialRoute: SplashPage.routeName,
        routes: <String, WidgetBuilder>{
          SplashPage.routeName: (context) => const SplashPage(),
          TutorialPage.routeName: (context) => const TutorialPage(),
          BasePage.routeName: (context) => BasePage.wrapped(),
          SignInPage.routeName: (context) => SignInPage.wrapped(),
          SignInEmailPage.routeName: (context) => SignInEmailPage(),
          RegisterPage.routeName: (context) => RegisterPage.wrapped(),
          UserDetailPage.routeName: (context) => const UserDetailPage(),
          SettingPage.routeName: (context) => const SettingPage(),
        },
      ),
    );
  }
}
