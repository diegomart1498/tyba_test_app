part of '../package.dart';

class PokemonImageCard extends StatelessWidget {
  const PokemonImageCard({
    required this.imageUrl,
    required this.pokemonId,
    super.key,
  });
  final String imageUrl;
  final int pokemonId;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: InkWell(
        borderRadius: BorderRadius.circular(UISize.p4),
        onTap: () =>
            loggwtf('$pokemonId $imageUrl'), //TODO: navigate to details page
        child: Container(
          margin: padding4,
          height: UISize.p144,
          width: UISize.p144,
          child: CustomCachedNetworkImage(
            imageUrl,
            borderRadius: BorderRadius.circular(UISize.p4),
          ),
        ),
      ),
    );
  }
}

//*-----------------------------------------------------------------------------

class PokemonImageCardShimmer extends StatelessWidget {
  const PokemonImageCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextShimmer(
      height: UISize.p144,
      width: UISize.p144,
    );
  }
}
