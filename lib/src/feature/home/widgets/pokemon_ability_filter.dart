part of '../package.dart';

class PokemonAbilitiesFilter extends ConsumerWidget {
  const PokemonAbilitiesFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PokemonNotifier pokemonNotifier = ref.read(pokemonProvider.notifier);

    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: Breakpoint.phone),
      child: Column(
        children: [
          Text(
            'Pokemon ability filter',
            style: context.textStyles.h6.semiBold.black,
          ),
          Text(
            'Select one ability',
            style: context.textStyles.subtitle1.light.black,
          ),
          gapH8,
          Flexible(
            child: InfinityScrollPaginatorBuilder<List<String>>(
              futurePaginated: (page) =>
                  pokemonNotifier.getPokemonsAbilitiesByPage(page),
              loadingBuilder: (context, index) =>
                  const PokemonAbilityTileShimmer(),
              itemBuilder: (context, index, items) =>
                  PokemonAbilityTile('${items[index]}'),
            ),
          ),
        ],
      ),
    );
  }
}
