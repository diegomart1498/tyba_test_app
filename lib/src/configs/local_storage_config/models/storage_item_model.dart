part of '../package.dart';

class StorageItem extends Equatable {
  final String key;
  final String value;

  const StorageItem({
    required this.key,
    required this.value,
  });

  static const String keySearch = 'search';
  static const String keyAbility = 'ability';

  @override
  List<Object> get props => [key, value];
}
