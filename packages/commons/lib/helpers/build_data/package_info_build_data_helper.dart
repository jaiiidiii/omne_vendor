// ignore_for_file: require_trailing_commas

import 'package:commons/helpers/build_data/build_data_helper.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoBuildDataHelper implements BuildDataHelper {
  PackageInfoBuildDataHelper({required this.environmentData});

  final EnvironmentData environmentData;

  @override
  Future<BuildInfo?> getBuildData() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final version = packageInfo.version;
    final environment = String.fromEnvironment(
      environmentData.key,
      defaultValue: environmentData.defaultValue,
    ).toUpperCase();
    return BuildInfo(
        environment: environment, version: version, buildNumber: packageInfo.buildNumber);
  }
}

class EnvironmentData {
  EnvironmentData({required this.key, required this.defaultValue});

  final String key, defaultValue;
}
