part of 'package.dart';

Future<void> showExceptionAlertDialog({
  required BuildContext context,
  required String title,
  required dynamic exception,
}) async {
  if (!context.mounted) return;
  await showAlertDialog(
    context: context,
    title: title,
    content: _message(exception),
    actionText: 'OK',
    seconds: null,
  );
}

String _message(dynamic exception) {
  if (exception is HttpException) {
    return exception.message;
  }
  if (exception is FormatException) {
    return exception.message;
  }
  if (exception is PlatformException) {
    return exception.message ?? exception.toString();
  }
  return exception.toString();
}

//*-----------------------------------------------------------------------------

class HttpException implements Exception {
  final String message;

  HttpException(this.message);

  @override
  String toString() {
    return message;
  }
}
