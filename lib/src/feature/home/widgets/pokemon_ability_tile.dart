part of '../package.dart';

class PokemonAbilityTile extends StatelessWidget {
  const PokemonAbilityTile(this.ability, {super.key});
  final String ability;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.pop(ability),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.bolt_outlined,
            color: Colors.amber,
          ),
          gapW8,
          Text(ability.capitalize),
        ],
      ),
    );
  }
}

//*-----------------------------------------------------------------------------

class PokemonAbilityTileShimmer extends StatelessWidget {
  const PokemonAbilityTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.bolt_outlined,
            color: Colors.amber,
          ),
          gapW8,
          TextShimmer(height: UISize.p24),
        ],
      ),
    );
  }
}
