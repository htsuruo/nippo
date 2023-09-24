import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:version/version.dart';

part 'app_info_provider.g.dart';

@riverpod
AppInfo? appInfo(AppInfoRef ref) => throw UnimplementedError();

@immutable
class AppInfo {
  const AppInfo({
    required this.appName,
    required this.packageName,
    required this.version,
    required this.buildNumber,
    required this.buildSignature,
  });
  final String appName;
  final String packageName;
  final Version version;
  final String buildNumber;
  final String buildSignature;
}
