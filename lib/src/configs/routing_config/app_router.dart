part of 'package.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigator = GlobalKey();

  static final GoRouter router = GoRouter(
    routes: _routes,
    navigatorKey: _rootNavigator,
    initialLocation: HomePage.route,
    errorBuilder: (context, state) => ErrorScreen(state.error),
  );

  static List<RouteBase> get _routes => [
        GoRoute(
          path: HomePage.route,
          builder: (context, state) => const HomePage(),
        ),
        // GoRoute(
        //   path: LoginPage.route,
        //   builder: (context, state) => const LoginPage(),
        //   pageBuilder: fadePageBuilder(const LoginPage()),
        //   routes: [
        //     GoRoute(
        //       path: RecoveryPasswordPage.route,
        //       builder: (context, state) => const RecoveryPasswordPage(),
        //       pageBuilder: slidePageBuilder(
        //         child: const RecoveryPasswordPage(),
        //         slideFrom: SlideFrom.rigth,
        //       ),
        //     ),
        //   ],
        // ),
      ];
}
