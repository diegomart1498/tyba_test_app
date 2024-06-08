part of '../package.dart';

class SearchPokemonButton extends StatelessWidget {
  const SearchPokemonButton({
    required this.onPressed,
    super.key,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(FontAwesomeIcons.google),
          gapW12,
          Flexible(
            child: Text(
              'Search this pokemon',
              style: context.textStyles.subtitle1.semiBold.white,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
