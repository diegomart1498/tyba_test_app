import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utilities/dialog/package.dart';
import '../../utilities/package.dart';

class UrlLauncherService {
  static Future<void> launch(
    String link,
    BuildContext context,
  ) async {
    try {
      final Uri uri = Uri.parse(link);
      if (defaultTargetPlatform == TargetPlatform.android) {
        if (!await launchUrl(uri, mode: LaunchMode.inAppBrowserView)) {
          throw Exception('Error launching URL!');
        }
      }
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        if (!await launchUrl(uri)) throw Exception('Error launching URL!');
      }
    } catch (error) {
      logge(error);
      if (context.mounted) {
        await showExceptionAlertDialog(
          context: context,
          title: '¡Error!',
          exception: 'Was not possible open this URL in this browser.',
        );
      }
    }
  }
}
