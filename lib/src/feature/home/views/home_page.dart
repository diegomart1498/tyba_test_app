part of '../package.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Align(
        child: Text('HomePage'),
      ),
    );
  }
}
