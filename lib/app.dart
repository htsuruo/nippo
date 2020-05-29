import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:nippo/models/repositories/auth_repository.dart';
import 'package:nippo/models/repositories/post_repository.dart';
import 'package:nippo/models/repositories/user_repository.dart';
import 'package:nippo/pages/auth/register_page.dart';
import 'package:nippo/pages/auth/sign_in_email_page.dart';
import 'package:nippo/pages/auth/sign_in_page.dart';
import 'package:nippo/pages/base_page.dart';
import 'package:nippo/pages/setting/setting_page.dart';
import 'package:nippo/pages/splash_page.dart';
import 'package:nippo/pages/tutorial/tutorial_page.dart';
import 'package:nippo/pages/user/user_detail_page.dart';
import 'package:nippo/theme.dart';
import 'package:provider/provider.dart';

import 'models/controllers/auth/auth_controller.dart';
import 'models/controllers/auth/auth_state.dart';

class MyApp extends StatelessWidget {
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
        )
      ],
      child: MaterialApp(
        title: 'NIPPO',
        theme: setTheme(context),
//      darkTheme: ThemeData.dark(), // これだけでダークモード的な事ができる.
        initialRoute: SplashPage.routeName,
        routes: <String, WidgetBuilder>{
          SplashPage.routeName: (context) => const SplashPage(),
          TutorialPage.routeName: (context) => const TutorialPage(),
          BasePage.routeName: (context) => BasePage.wrapped(),
          SignInPage.routeName: (context) => SignInPage.wrapped(),
          SignInEmailPage.routeName: (context) => SignInEmailPage(),
          RegisterPage.routeName: (context) => const RegisterPage(),
          UserDetailPage.routeName: (context) => const UserDetailPage(),
          SettingPage.routeName: (context) => const SettingPage(),
        },
      ),
    );
  }
}
