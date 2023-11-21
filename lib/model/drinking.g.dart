// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drinking.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DrinkingCWProxy {
  Drinking drinkingName(String drinkingName);

  Drinking ice(int ice);

  Drinking id(String id);

  Drinking sugar(int sugar);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Drinking(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Drinking(...).copyWith(id: 12, name: "My name")
  /// ````
  Drinking call({
    String? drinkingName,
    int? ice,
    String? id,
    int? sugar,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDrinking.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDrinking.copyWith.fieldName(...)`
class _$DrinkingCWProxyImpl implements _$DrinkingCWProxy {
  final Drinking _value;

  const _$DrinkingCWProxyImpl(this._value);

  @override
  Drinking drinkingName(String drinkingName) =>
      this(drinkingName: drinkingName);

  @override
  Drinking ice(int ice) => this(ice: ice);

  @override
  Drinking id(String id) => this(id: id);

  @override
  Drinking sugar(int sugar) => this(sugar: sugar);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Drinking(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Drinking(...).copyWith(id: 12, name: "My name")
  /// ````
  Drinking call({
    Object? drinkingName = const $CopyWithPlaceholder(),
    Object? ice = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? sugar = const $CopyWithPlaceholder(),
  }) {
    return Drinking(
      drinkingName:
          drinkingName == const $CopyWithPlaceholder() || drinkingName == null
              ? _value.drinkingName
              // ignore: cast_nullable_to_non_nullable
              : drinkingName as String,
      ice: ice == const $CopyWithPlaceholder() || ice == null
          ? _value.ice
          // ignore: cast_nullable_to_non_nullable
          : ice as int,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      sugar: sugar == const $CopyWithPlaceholder() || sugar == null
          ? _value.sugar
          // ignore: cast_nullable_to_non_nullable
          : sugar as int,
    );
  }
}

extension $DrinkingCopyWith on Drinking {
  /// Returns a callable class that can be used as follows: `instanceOfDrinking.copyWith(...)` or like so:`instanceOfDrinking.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DrinkingCWProxy get copyWith => _$DrinkingCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Drinking _$DrinkingFromJson(Map<String, dynamic> json) => Drinking(
      id: json['id'] as String,
      drinkingName: json['drinkingName'] as String,
      sugar: json['sugar'] as int,
      ice: json['ice'] as int,
    );

Map<String, dynamic> _$DrinkingToJson(Drinking instance) => <String, dynamic>{
      'id': instance.id,
      'drinkingName': instance.drinkingName,
      'sugar': instance.sugar,
      'ice': instance.ice,
    };
