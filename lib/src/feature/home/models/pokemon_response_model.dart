part of '../package.dart';

class Pokemon {
  final int id;
  final String name;
  final String image;
  final List<String> abilities;

  Pokemon({
    required this.name,
    required this.image,
    required this.id,
    required this.abilities,
  });

  factory Pokemon.fromRawJson(String str) => Pokemon.fromJson(json.decode(str));

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json["id"],
        name: json["name"],
        image: json["sprites"]["front_default"],
        abilities: List<String>.from(
            json["abilities"].map((x) => x["ability"]["name"])),
      );

  @override
  String toString() =>
      'Pokemon(id: $id, name: $name, image: $image, abilities: $abilities)';
}
