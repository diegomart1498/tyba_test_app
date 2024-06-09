part of '../package.dart';

class AbilityFilterButton extends ConsumerWidget {
  const AbilityFilterButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: const Icon(Icons.filter_alt),
      onPressed: () =>
          ref.read(pokemonProvider.notifier).selectPokemonAbility(context),
    );
  }
}
