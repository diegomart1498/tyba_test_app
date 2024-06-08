part of '../package.dart';

class PokemonState extends Equatable {
  final String filter1;
  final String filter2;

  const PokemonState({
    this.filter1 = '',
    this.filter2 = '',
  });

  PokemonState copyWith({
    String? filter1,
    String? filter2,
  }) {
    return PokemonState(
      filter1: filter1 ?? this.filter1,
      filter2: filter2 ?? this.filter2,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [filter1, filter2];
}
