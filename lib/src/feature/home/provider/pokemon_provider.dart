part of '../package.dart';

final pokemonProvider =
    StateNotifierProvider<PokemonNotifier, PokemonState>((ref) {
  return PokemonNotifier(ref);
});

final pokemonByIdProvider =
    FutureProvider.family.autoDispose<Pokemon?, int>((ref, pokemonId) {
  return ref.watch(pokemonProvider.notifier).getPokemonById(pokemonId);
});

final pokemonByAbilityProvider =
    FutureProvider.family.autoDispose<List<String>, String?>((ref, ability) {
  return ref.watch(pokemonProvider.notifier).getPokemonsByAbility(ability);
});

class PokemonNotifier extends StateNotifier<PokemonState> {
  PokemonNotifier(this.ref) : super(const PokemonState());
  StateNotifierProviderRef<PokemonNotifier, PokemonState> ref;

  Future<List<String>> getPokemonImagesPaginated({
    required int page,
    int limit = 20,
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

  Future<List<String>> getPokemonsAbilitiesByPage(
    int page, {
    int limit = 20,
  }) async {
    try {
      final List<String> pokemonsAbilities = await ref
          .read(pokemonRepositoryProvider)
          .getPokemonsAbilities(offset: (page - 1) * limit, limit: limit);
      loggwtf(pokemonsAbilities);
      return pokemonsAbilities;
    } catch (error, stack) {
      logge('getPokemonsAbilitiesByPage -> $error $stack');
      return [];
    }
  }

  Future<List<String>> getPokemonsByAbility(String? ability) async {
    if (ability == null) return [];
    try {
      final List<String> pokemons = await ref
          .read(pokemonRepositoryProvider)
          .getPokemonsByAbility(ability);
      loggwtf(pokemons);
      return pokemons;
    } catch (error, stack) {
      logge('getPokemonByAbility -> $error $stack');
      return [];
    }
  }

  Future<void> selectPokemonAbility(BuildContext context) async {
    final String? response = await showCustomDialog<String?>(
      context: context,
      content: const PokemonAbilitiesFilter(),
    );
    updateSelectedAbility(response);
    await ref
        .read(sharedPreferencesServiceProvider)
        .saveAbility(response ?? '');
  }

  void getAbilitityFilterFromLocalStorage() {
    final String ability =
        ref.read(sharedPreferencesServiceProvider).getAbility();
    updateSelectedAbility(ability.isNotEmpty ? ability : null);
  }

  //Setters
  void updateSelectedAbility(String? ability) {
    state = state.copyWith(ability: () => ability);
  }
}
