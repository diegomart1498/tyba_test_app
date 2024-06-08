part of '../package.dart';

class PokemonAbilities extends StatelessWidget {
  const PokemonAbilities({
    required this.pokemon,
    super.key,
  });

  final Pokemon? pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Pokemon abilities',
          style: context.textStyles.h6.semiBold.black,
        ),
        gapH12,
        if (pokemon != null)
          ...pokemon!.abilities.map(
            (ability) => Padding(
              padding: paddingV4,
              child: Text(
                ability.capitalize,
                style: context.textStyles.subtitle1.regular.black,
              ),
            ),
          ),
      ],
    );
  }
}
