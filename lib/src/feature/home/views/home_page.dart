part of '../package.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static const String route = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PokemonNotifier pokemonNotifier = ref.read(pokemonProvider.notifier);

    return PageWrapper(
      hasBackButton: false,
      body: InfinityScrollPaginatorBuilder<List<String>>(
        futurePaginated: (page) =>
            pokemonNotifier.getPokemonImagesPaginated(page: page),
        loadingBuilder: (context, index) => const PokemonImageCardShimmer(),
        itemBuilder: (context, index, items) => PokemonImageCard(
          imageUrl: items[index],
          pokemonId: index + 1,
        ),
      ),
    );
  }
}
