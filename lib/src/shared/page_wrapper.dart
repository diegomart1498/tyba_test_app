part of 'package.dart';

class PageWrapper extends StatelessWidget {
  const PageWrapper({
    required this.body,
    this.hasBackButton = false,
    super.key,
  });

  final Widget body;
  final bool hasBackButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon App'),
        elevation: UISize.p2,
        centerTitle: true,
        leading: hasBackButton ? const CustomBackButton() : null,
      ),
      body: body,
    );
  }
}
