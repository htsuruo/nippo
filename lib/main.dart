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

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  late final AppInfo appInfo;
  await PackageInfo.fromPlatform().then((value) {
    appInfo = AppInfo(
      appName: value.appName,
      packageName: value.packageName,
      version: Version.parse(value.version),
      buildNumber: value.buildNumber,
      buildSignature: value.buildSignature,
    );
  });

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
