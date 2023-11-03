import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
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
    // 一度デバッグトークンを登録しておけば、その後は優先的にデバッグトークンを使い続けるものと思っていたが、
    // activate時に`debug`指定しないとサーバ検証時にエラーになってしまトークンが返却されない
    // （未検証リクエスト判定）ので、一度登録した場合でもデバッグトークンを使いたい場合は`debug`指定が必要
    androidProvider:
        kDebugMode ? AndroidProvider.debug : AndroidProvider.playIntegrity,
    appleProvider: kDebugMode
        ? AppleProvider.debug
        : AppleProvider.appAttestWithDeviceCheckFallback,
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
