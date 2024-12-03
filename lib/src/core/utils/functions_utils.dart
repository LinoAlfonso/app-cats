
import 'package:package_info_plus/package_info_plus.dart';

/// Get the app version and build number
Future<String> getAppVersion() async {
  final packageInfo = await PackageInfo.fromPlatform();
  return '${packageInfo.version} (${packageInfo.buildNumber})';
}