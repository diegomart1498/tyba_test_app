part of 'package.dart';

class EndPageDivider extends StatelessWidget {
  const EndPageDivider({
    this.bottomSpace = 56.0,
    super.key,
  });

  final double bottomSpace;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: UISize.p12,
        bottom: bottomSpace,
        left: UISize.p16,
        right: UISize.p16,
      ),
      child: const Divider(),
    );
  }
}
