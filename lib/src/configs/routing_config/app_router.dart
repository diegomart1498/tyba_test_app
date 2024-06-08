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
          routes: [
            GoRoute(
              path: PokemonDetailsPage.route,
              name: PokemonDetailsPage.routeName,
              builder: (context, state) {
                final String pokemonImage =
                    state.uri.queryParameters['pokemonImage'].toString();
                final int pokemonId = int.parse(
                    state.uri.queryParameters['pokemonId'].toString());
                return PokemonDetailsPage(
                  pokemonImage: pokemonImage,
                  pokemonId: pokemonId,
                );
              },
            ),
          ],
        ),
      ];
}
