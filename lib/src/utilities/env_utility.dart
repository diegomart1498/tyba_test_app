part of 'package.dart';

String getEnv(String key) {
  return dotenv.env[key] ?? '';
}
