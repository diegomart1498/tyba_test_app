import '../../utilities/package.dart';

class HostEnvironment {
  static String get urlScheme => getEnv('UrlScheme');
  static String get urlDomain => getEnv('UrlDomain');

  static String get schemeAndDomain => '$urlScheme$urlDomain';
}
