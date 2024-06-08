import 'dart:convert';

class Pokemon {
  final String name;
  final String image;
  final String id;

  Pokemon({
    required this.name,
    required this.image,
    required this.id,
  });

  factory Pokemon.fromRawJson(String str) => Pokemon.fromJson(json.decode(str));

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        name: json["name"],
        image: json["sprites"]["front_default"],
        id: json["game_indices"]["id"],
      );
}
