import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:version/version.dart';

part 'app_info_provider.g.dart';

// TODO(tsuruoka): `throw UnimplementedError()`にしたいが、Code generationだと起動できなくなる
@riverpod
AppInfo appInfo(AppInfoRef ref) => AppInfo.empty();

@immutable
class AppInfo {
  const AppInfo({
    required this.appName,
    required this.packageName,
    required this.version,
    required this.buildNumber,
    required this.buildSignature,
  });

  factory AppInfo.empty() {
    return AppInfo(
      appName: '',
      packageName: '',
      version: Version.parse('0.0.0'),
      buildNumber: '',
      buildSignature: '',
    );
  }

  final String appName;
  final String packageName;
  final Version version;
  final String buildNumber;
  final String buildSignature;
}
