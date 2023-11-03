import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nippo/app.dart';
import 'package:nippo/firebase_options.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'common/common.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();

  final (_, appInfo) = await (
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
    PackageInfo.fromPlatform().then(AppInfo.fromPackageInfo),
  ).wait;

  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaEnterpriseProvider(
      '6Le3MeQoAAAAANvhE-K5ZL2F7jwuE0GNQz1Pka_x',
    ),
    // デバッグトークンを新たに取得したい場合は以下コメントアウトを外して確認してください。
    // androidProvider: AndroidProvider.debug,
    // appleProvider: AppleProvider.debug,
  );

  // DateTimeのdefaultLocaleを日本時間にする
  Intl.defaultLocale = 'ja';
  runApp(
    ProviderScope(
      overrides: [
        appInfoProvider.overrideWithValue(appInfo),
      ],
      child: const MyApp(),
    ),
  );
}
