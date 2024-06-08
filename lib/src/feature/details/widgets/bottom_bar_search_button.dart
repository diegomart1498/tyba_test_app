part of '../package.dart';

class BottomBarSearchButton extends ConsumerWidget {
  const BottomBarSearchButton(this.pokemon, {super.key});
  final Pokemon? pokemon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomBarTemplate(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          gapH4,
          SearchPokemonButton(
            onPressed: () => ref
                .read(pokemonProvider.notifier)
                .searchPokemonInGoogle(pokemon, context),
          ),
          gapH4,
        ],
      ),
    );
  }
}
