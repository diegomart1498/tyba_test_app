part of '../package.dart';

final pokemonRepositoryProvider = Provider<PokemonRepository>((ref) {
  return PokemonRepository();
});

class PokemonRepository {
  final String _baseUrl = HostEnvironment.schemeAndDomain;

  String getPokemonImage(int pokemonId) {
    const int pokemonNumberLimit = 1000;
    if (pokemonId > pokemonNumberLimit) {
      throw Exception("There is not more pokemons");
    }
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$pokemonId.png';
  }

  Future<Pokemon> getPokemonById(int pokemonId) async {
    final Uri url = Uri.parse('$_baseUrl/pokemon/$pokemonId');

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
    };

    final response = await http.get(url, headers: headers);
    final Map<String, dynamic> decodedData = json.decode(response.body);
    if (response.statusCode != 200) throw Exception('Error getting pokemon');
    return Pokemon.fromJson(decodedData);
  }

  Future<List<String>> getPokemonsAbilities({
    required int offset,
    required int limit,
  }) async {
    final Uri url = Uri.parse('$_baseUrl/ability?offset=$offset&$limit=20');

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
    };

    final response = await http.get(url, headers: headers);
    final Map<String, dynamic> decodedData = json.decode(response.body);
    if (response.statusCode != 200) {
      throw Exception('Error getting pokemon abilities');
    }
    return PokemonAbilities.fromJson(decodedData).abilities;
  }

  Future<List<String>> getPokemonsByAbility(String ability) async {
    final Uri url = Uri.parse('$_baseUrl/ability/$ability');

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
    };

    final response = await http.get(url, headers: headers);
    final Map<String, dynamic> decodedData = json.decode(response.body);
    if (response.statusCode != 200) {
      throw Exception('Error getting pokemon by abilities');
    }
    return List<String>.from(
        decodedData["pokemon"].map((x) => x['pokemon']['name']));
  }
}
