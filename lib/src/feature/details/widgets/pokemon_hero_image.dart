part of '../package.dart';

class PokemonHeroImage extends StatelessWidget {
  const PokemonHeroImage({
    super.key,
    required this.pokemonImage,
  });

  final String pokemonImage;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Hero(
      tag: pokemonImage,
      child: CustomCachedNetworkImage(
        pokemonImage,
        height: min(size.width * 0.7, size.height * 0.5),
        borderRadius: BorderRadius.circular(UISize.p4),
      ),
    );
  }
}
