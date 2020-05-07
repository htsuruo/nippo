import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:nippo/pages/create.dart';
import 'package:nippo/pages/home.dart';
import 'package:nippo/pages/setting.dart';
import 'package:nippo/pages/signin.dart';
import 'package:nippo/pages/splash.dart';
import 'package:nippo/pages/user.dart';
import 'package:nippo/states/progress_hub_state.dart';
import 'package:nippo/states/user.dart';
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
        StateNotifierProvider<UserController, UserState>(
          create: (context) => UserController(),
        )
      ],
      child: MaterialApp(
        title: 'NIPPO',
        theme: setTheme(context),
//      darkTheme: ThemeData.dark(), // これだけでダークモード的な事ができる.
        initialRoute: SplashPage.routeName,
        routes: <String, WidgetBuilder>{
          SplashPage.routeName: (context) => SplashPage(),
          HomePage.routeName: (context) => HomePage(),
          SignInPage.routeName: (context) => SignInPage(),
          UserPage.routeName: (context) => UserPage(),
          SettingPage.routeName: (context) => SettingPage(),
          CreatePage.routeName: (context) => CreatePage(),
        },
      ),
    );
  }
}
