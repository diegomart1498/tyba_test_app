part of '../package.dart';

final pokemonProvider =
    StateNotifierProvider<PokemonNotifier, PokemonState>((ref) {
  return PokemonNotifier(ref);
});

class PokemonNotifier extends StateNotifier<PokemonState> {
  PokemonNotifier(this.ref) : super(const PokemonState());

  StateNotifierProviderRef<PokemonNotifier, PokemonState> ref;

  Future<List<String>> getPokemonImagesPaginated({
    required int page,
    int limit = 10,
  }) async {
    final List<int> pokemonsId = List.generate(
      limit,
      (index) => limit * (page - 1) + index + 1,
    );
    try {
      final List<String> pokemonImages = pokemonsId
          .map((pokemonId) =>
              ref.read(pokemonRepositoryProvider).getPokemonImage(pokemonId))
          .toList();
      loggwtf(pokemonImages);
      return pokemonImages;
    } catch (error) {
      debugPrint('getPokemonImagesPaginated -> $error');
      return [];
    }
  }
}
