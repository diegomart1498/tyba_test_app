part of '../package.dart';

extension DynamicExtension on String {
  String get capitalize {
    return ReCase(this).sentenceCase;
  }

  String get titleCase {
    return ReCase(this).titleCase;
  }
}
