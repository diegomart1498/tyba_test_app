part of 'package.dart';

class PageWrapper extends StatelessWidget {
  const PageWrapper({
    required this.body,
    this.hasBackButton = false,
    this.bottomNavigationBar,
    this.actions = const [],
    super.key,
  });

  final Widget body;
  final bool hasBackButton;
  final Widget? bottomNavigationBar;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon App'),
        elevation: UISize.p2,
        centerTitle: true,
        actions: actions,
        leading: hasBackButton ? const CustomBackButton() : null,
      ),
      body: body,
      bottomNavigationBar: bottomNavigationBar != null
          ? SafeArea(child: bottomNavigationBar!)
          : null,
    );
  }
}
