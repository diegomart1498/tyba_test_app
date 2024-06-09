part of '../package.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  static const String route = '/home';

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(pokemonProvider.notifier).getAbilitityFilterFromLocalStorage();
    });
  }

  @override
  Widget build(BuildContext context) {
    final PokemonNotifier pokemonNotifier = ref.read(pokemonProvider.notifier);
    final String? selectedAbility = ref.watch(pokemonProvider).ability;
    final AsyncValue<List<String>> pokemonsByAbility =
        ref.watch(pokemonByAbilityProvider(selectedAbility));

    return PageWrapper(
      actions: const [AbilityFilterButton()],
      hasBackButton: false,
      body: Column(
        children: [
          if (selectedAbility != null)
            Padding(
              padding: paddingV12,
              child: Text(
                'Filtering by: $selectedAbility',
                style: context.textStyles.subtitle1.semiBold.black,
              ),
            ),
          if (selectedAbility == null)
            Flexible(
              child: InfinityScrollPaginatorBuilder<List<String>>(
                futurePaginated: (page) =>
                    pokemonNotifier.getPokemonImagesPaginated(page: page),
                loadingBuilder: (context, index) =>
                    const PokemonImageCardShimmer(),
                itemBuilder: (context, index, items) => PokemonImageCard(
                  imageUrl: items[index],
                  pokemonId: index + 1,
                ),
              ),
            ),
          if (selectedAbility != null)
            pokemonsByAbility.when(
              data: (pokemos) => Flexible(
                child: ListView(
                  children: [
                    ...pokemos.map(
                      (pokemon) => PokemonAbilityTile(pokemon),
                    ),
                  ],
                ),
              ),
              error: (_, __) => const SizedBox.shrink(),
              loading: () => const Align(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}
