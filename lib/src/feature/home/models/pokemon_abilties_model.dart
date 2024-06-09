part of '../package.dart';

class PokemonAbilities {
  final int count;
  final List<String> abilities;

  PokemonAbilities({
    required this.count,
    required this.abilities,
  });

  factory PokemonAbilities.fromRawJson(String str) =>
      PokemonAbilities.fromJson(json.decode(str));

  factory PokemonAbilities.fromJson(Map<String, dynamic> json) =>
      PokemonAbilities(
        count: json["count"],
        abilities: List<String>.from(json["results"].map((x) => x["name"])),
      );

  @override
  String toString() => 'Pokemon(count: $count, abilities: $abilities)';
}
