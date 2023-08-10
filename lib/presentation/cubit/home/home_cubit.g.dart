// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_cubit.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$ReadyAutoequal on Ready {
  @Deprecated(r'Use _$props instead')
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props => [characters, searchCharacters];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ReadyCWProxy {
  Ready characters(List<CharacterDetails> characters);

  Ready searchCharacters(List<CharacterDetails> searchCharacters);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Ready(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Ready(...).copyWith(id: 12, name: "My name")
  /// ````
  Ready call({
    List<CharacterDetails>? characters,
    List<CharacterDetails>? searchCharacters,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfReady.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfReady.copyWith.fieldName(...)`
class _$ReadyCWProxyImpl implements _$ReadyCWProxy {
  const _$ReadyCWProxyImpl(this._value);

  final Ready _value;

  @override
  Ready characters(List<CharacterDetails> characters) =>
      this(characters: characters);

  @override
  Ready searchCharacters(List<CharacterDetails> searchCharacters) =>
      this(searchCharacters: searchCharacters);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Ready(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Ready(...).copyWith(id: 12, name: "My name")
  /// ````
  Ready call({
    Object? characters = const $CopyWithPlaceholder(),
    Object? searchCharacters = const $CopyWithPlaceholder(),
  }) {
    return Ready(
      characters:
          characters == const $CopyWithPlaceholder() || characters == null
              ? _value.characters
              // ignore: cast_nullable_to_non_nullable
              : characters as List<CharacterDetails>,
      searchCharacters: searchCharacters == const $CopyWithPlaceholder() ||
              searchCharacters == null
          ? _value.searchCharacters
          // ignore: cast_nullable_to_non_nullable
          : searchCharacters as List<CharacterDetails>,
    );
  }
}

extension $ReadyCopyWith on Ready {
  /// Returns a callable class that can be used as follows: `instanceOfReady.copyWith(...)` or like so:`instanceOfReady.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ReadyCWProxy get copyWith => _$ReadyCWProxyImpl(this);
}
