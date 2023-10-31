import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nippo/app.dart';
import 'package:nippo/firebase_options.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:version/version.dart';

import 'common/common.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();

  final (_, appInfo) = await (
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
    PackageInfo.fromPlatform().then(
      (value) => AppInfo(
        appName: value.appName,
        packageName: value.packageName,
        version: Version.parse(value.version),
        buildNumber: value.buildNumber,
        buildSignature: value.buildSignature,
      ),
    ),
  ).wait;

  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.debug,
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
