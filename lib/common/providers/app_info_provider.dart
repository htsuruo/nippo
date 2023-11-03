import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:version/version.dart';

part 'app_info_provider.g.dart';

@riverpod
AppInfo appInfo(AppInfoRef ref) => throw UnimplementedError();

@immutable
class AppInfo {
  const AppInfo._({
    required this.appName,
    required this.packageName,
    required this.version,
    required this.buildNumber,
    required this.buildSignature,
  });

  AppInfo.fromPackageInfo(PackageInfo info)
      : this._(
          appName: info.appName,
          packageName: info.packageName,
          version: Version.parse(info.version),
          buildNumber: info.buildNumber,
          buildSignature: info.buildSignature,
        );

  final String appName;
  final String packageName;
  final Version version;
  final String buildNumber;
  final String buildSignature;
  @override
  String toString() {
    // ignore: lines_longer_than_80_chars
    return 'AppInfo{appName: $appName, packageName: $packageName, version: $version, buildNumber: $buildNumber, buildSignature: $buildSignature}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppInfo &&
          runtimeType == other.runtimeType &&
          appName == other.appName &&
          packageName == other.packageName &&
          version == other.version &&
          buildNumber == other.buildNumber &&
          buildSignature == other.buildSignature;

  @override
  int get hashCode =>
      appName.hashCode ^
      packageName.hashCode ^
      version.hashCode ^
      buildNumber.hashCode ^
      buildSignature.hashCode;
}
