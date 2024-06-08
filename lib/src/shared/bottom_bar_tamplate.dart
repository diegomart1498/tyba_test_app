part of 'package.dart';

class BottomBarTemplate extends StatelessWidget {
  const BottomBarTemplate({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 400),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(UISize.p32),
            topRight: Radius.circular(UISize.p32),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              offset: const Offset(0, 0),
              blurRadius: UISize.p16,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(
          vertical: UISize.p16,
          horizontal: UISize.p20,
        ),
        child: child,
      ),
    );
  }
}
