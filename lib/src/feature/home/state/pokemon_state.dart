part of '../package.dart';

class PokemonState extends Equatable {
  final String? ability;
  final String filter2;

  const PokemonState({
    this.ability,
    this.filter2 = '',
  });

  PokemonState copyWith({
    ValueGetter<String?>? ability,
    String? filter2,
  }) {
    return PokemonState(
      ability: ability != null ? ability() : this.ability,
      filter2: filter2 ?? this.filter2,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [ability, filter2];
}
