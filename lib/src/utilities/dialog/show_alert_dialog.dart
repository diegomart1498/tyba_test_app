part of 'package.dart';

Future<bool?> showAlertDialog({
  required BuildContext context,
  required String title,
  String? actionText,
  String? content,
  String? cancelText,
  int? seconds = DurationsUI.dialog,
}) {
  if (kIsWeb || !Platform.isIOS) {
    return showDialog(
      context: context,
      builder: (context) {
        if (seconds != null) {
          Future.delayed(Duration(seconds: seconds), () {
            if (context.mounted) {
              Navigator.of(context).pop(false);
            }
          });
        }
        return AlertDialog(
          title: Text(title),
          content: content != null ? Text(content) : null,
          actions: <Widget>[
            if (cancelText != null)
              TextButton(
                child: Text(cancelText),
                onPressed: () => Navigator.of(context).pop(false),
              ),
            if (actionText != null)
              FilledButton(
                child: Text(actionText),
                onPressed: () => Navigator.of(context).pop(true),
              ),
          ],
        );
      },
    );
  }
  return showCupertinoDialog(
    context: context,
    builder: (context) {
      if (seconds != null) {
        Future.delayed(Duration(seconds: seconds), () {
          if (context.mounted) {
            Navigator.of(context).pop(false);
          }
        });
      }
      return CupertinoAlertDialog(
        title: Text(title),
        content: content != null ? Text(content) : null,
        actions: <Widget>[
          if (cancelText != null)
            CupertinoDialogAction(
              child: Text(cancelText),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          if (actionText != null)
            CupertinoDialogAction(
              child: Text(actionText),
              onPressed: () => Navigator.of(context).pop(true),
            ),
        ],
      );
    },
  );
}

//*-----------------------------------------------------------------------------

Future<void> showAlertDialogVoidCallback({
  required BuildContext context,
  required String title,
  String? content,
  String? actionText,
  VoidCallback? actionCallback,
  String? secondaryText,
  VoidCallback? secondaryCallback,
  int? seconds = DurationsUI.dialog,
}) {
  if (kIsWeb || !Platform.isIOS) {
    return showDialog(
      context: context,
      builder: (context) {
        if (seconds != null) {
          Future.delayed(Duration(seconds: seconds), () {
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          });
        }
        return AlertDialog(
          title: Text(title),
          content: content != null ? Text(content) : null,
          actions: <Widget>[
            if (secondaryText != null)
              TextButton(
                onPressed: secondaryCallback,
                child: Text(secondaryText),
              ),
            if (actionText != null)
              FilledButton(
                onPressed: actionCallback,
                child: Text(actionText),
              ),
          ],
        );
      },
    );
  }
  return showCupertinoDialog(
    context: context,
    builder: (context) {
      if (seconds != null) {
        Future.delayed(Duration(seconds: seconds), () {
          if (context.mounted) {
            Navigator.of(context).pop(false);
          }
        });
      }
      return CupertinoAlertDialog(
        title: Text(title),
        content: content != null ? Text(content) : null,
        actions: <Widget>[
          if (secondaryText != null)
            CupertinoDialogAction(
              onPressed: secondaryCallback,
              child: Text(secondaryText),
            ),
          if (actionText != null)
            CupertinoDialogAction(
              onPressed: actionCallback,
              child: Text(actionText),
            ),
        ],
      );
    },
  );
}
