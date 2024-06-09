part of 'package.dart';

Future<T?> showCustomDialog<T>({
  required BuildContext context,
  required Widget content,
  int? seconds,
}) {
  if (seconds != null) {
    Future.delayed(Duration(seconds: seconds), () {
      Navigator.of(context).pop();
    });
  }
  return showDialog<T?>(
    context: context,
    builder: (context) => AlertDialog(
      content: content,
      contentPadding: paddingV28,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: UISize.p20,
        vertical: UISize.p56,
      ),
      surfaceTintColor: Colors.transparent,
    ),
  );
}
