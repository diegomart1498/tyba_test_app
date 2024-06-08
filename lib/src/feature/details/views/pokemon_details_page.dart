part of '../package.dart';

class PokemonDetailsPage extends ConsumerWidget {
  const PokemonDetailsPage({
    required this.pokemonId,
    this.pokemonImage = '',
    super.key,
  });

  final int pokemonId;
  final String pokemonImage;
  static const String route = 'details';
  static const String fullRoute = '${HomePage.route}/$route';
  static const String routeName = 'pokemon-details';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Pokemon?> pokemonById =
        ref.watch(pokemonByIdProvider(pokemonId));

    return PageWrapper(
      hasBackButton: true,
      body: Column(
        children: [
          gapH24,
          pokemonById.when(
            data: (pokemon) => Text(
              pokemon?.name.capitalize ?? '',
              style: context.textStyles.h4.semiBold.black,
            ),
            loading: () => const TextShimmer(height: UISize.p32),
            error: (_, __) => const SizedBox.shrink(),
          ),
          PokemonHeroImage(pokemonImage: pokemonImage),
          pokemonById.when(
            data: (pokemon) => PokemonAbilities(pokemon: pokemon),
            loading: () => const TextShimmer(height: UISize.p28),
            error: (_, __) => const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
