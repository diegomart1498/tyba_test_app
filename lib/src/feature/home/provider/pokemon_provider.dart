part of '../package.dart';

final pokemonProvider =
    StateNotifierProvider<PokemonNotifier, PokemonState>((ref) {
  return PokemonNotifier(ref);
});

final pokemonByIdProvider =
    FutureProvider.family.autoDispose<Pokemon?, int>((ref, pokemonId) {
  return ref.watch(pokemonProvider.notifier).getPokemonById(pokemonId);
});

class PokemonNotifier extends StateNotifier<PokemonState> {
  PokemonNotifier(this.ref) : super(const PokemonState());
  StateNotifierProviderRef<PokemonNotifier, PokemonState> ref;

  Future<List<String>> getPokemonImagesPaginated({
    required int page,
    int limit = 10,
  }) async {
    final List<int> pokemonsId =
        List.generate(limit, (index) => limit * (page - 1) + index + 1);
    try {
      final List<String> pokemonImages = pokemonsId
          .map((pokemonId) =>
              ref.read(pokemonRepositoryProvider).getPokemonImage(pokemonId))
          .toList();
      return pokemonImages;
    } catch (error) {
      logge('getPokemonImagesPaginated -> $error');
      return [];
    }
  }

  Future<Pokemon?> getPokemonById(int pokemonId) async {
    try {
      final Pokemon pokemon =
          await ref.read(pokemonRepositoryProvider).getPokemonById(pokemonId);
      return pokemon;
    } catch (error, stack) {
      logge('getPokemonById -> $error $stack');
      return null;
    }
  }

  Future<void> searchPokemonInGoogle(
    Pokemon? pokemon,
    BuildContext context,
  ) async {
    final String pokemonName = pokemon?.name ?? '';
    final String url = 'https://www.google.com/search?q=$pokemonName';
    await UrlLauncherService.launch(url, context);
  }
}
