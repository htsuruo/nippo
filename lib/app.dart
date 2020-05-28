import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:nippo/models/controllers/auth/auth_controller.dart';
import 'package:nippo/models/controllers/auth/auth_state.dart';
import 'package:nippo/pages/auth/register_page.dart';
import 'package:nippo/pages/auth/sign_in_email_page.dart';
import 'package:nippo/pages/auth/sign_in_page.dart';
import 'package:nippo/pages/base_page.dart';
import 'package:nippo/pages/post/post_create_page.dart';
import 'package:nippo/pages/profile/setting_page.dart';
import 'package:nippo/pages/splash_page.dart';
import 'package:nippo/pages/tutorial_page.dart';
import 'package:nippo/pages/user/user_detail_page.dart';
import 'package:nippo/pages/user/user_list_page.dart';
import 'package:nippo/states/progress_hub_state.dart';
import 'package:nippo/theme.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProgressHUDState>(
          create: (context) => ProgressHUDState(),
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
          SignInPage.routeName: (context) => SignInPage(),
          SignInEmailPage.routeName: (context) => SignInEmailPage(),
          RegisterPage.routeName: (context) => const RegisterPage(),
          UserPage.routeName: (context) => UserPage(),
          UserDetailPage.routeName: (context) => const UserDetailPage(),
          SettingPage.routeName: (context) => const SettingPage(),
          CreatePage.routeName: (context) => CreatePage(),
        },
      ),
    );
  }
}
