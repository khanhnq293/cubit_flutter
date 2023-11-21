// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drinking_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DrinkingStateCWProxy {
  DrinkingState addStatus(DrinkingStatus addStatus);

  DrinkingState convertStatus(DrinkingStatus convertStatus);

  DrinkingState deleteStatus(DrinkingStatus deleteStatus);

  DrinkingState drinksMap(Map<String, Drinking> drinksMap);

  DrinkingState ids(List<String> ids);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DrinkingState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DrinkingState(...).copyWith(id: 12, name: "My name")
  /// ````
  DrinkingState call({
    DrinkingStatus? addStatus,
    DrinkingStatus? convertStatus,
    DrinkingStatus? deleteStatus,
    Map<String, Drinking>? drinksMap,
    List<String>? ids,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDrinkingState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDrinkingState.copyWith.fieldName(...)`
class _$DrinkingStateCWProxyImpl implements _$DrinkingStateCWProxy {
  final DrinkingState _value;

  const _$DrinkingStateCWProxyImpl(this._value);

  @override
  DrinkingState addStatus(DrinkingStatus addStatus) =>
      this(addStatus: addStatus);

  @override
  DrinkingState convertStatus(DrinkingStatus convertStatus) =>
      this(convertStatus: convertStatus);

  @override
  DrinkingState deleteStatus(DrinkingStatus deleteStatus) =>
      this(deleteStatus: deleteStatus);

  @override
  DrinkingState drinksMap(Map<String, Drinking> drinksMap) =>
      this(drinksMap: drinksMap);

  @override
  DrinkingState ids(List<String> ids) => this(ids: ids);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DrinkingState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DrinkingState(...).copyWith(id: 12, name: "My name")
  /// ````
  DrinkingState call({
    Object? addStatus = const $CopyWithPlaceholder(),
    Object? convertStatus = const $CopyWithPlaceholder(),
    Object? deleteStatus = const $CopyWithPlaceholder(),
    Object? drinksMap = const $CopyWithPlaceholder(),
    Object? ids = const $CopyWithPlaceholder(),
  }) {
    return DrinkingState(
      addStatus: addStatus == const $CopyWithPlaceholder() || addStatus == null
          ? _value.addStatus
          // ignore: cast_nullable_to_non_nullable
          : addStatus as DrinkingStatus,
      convertStatus:
          convertStatus == const $CopyWithPlaceholder() || convertStatus == null
              ? _value.convertStatus
              // ignore: cast_nullable_to_non_nullable
              : convertStatus as DrinkingStatus,
      deleteStatus:
          deleteStatus == const $CopyWithPlaceholder() || deleteStatus == null
              ? _value.deleteStatus
              // ignore: cast_nullable_to_non_nullable
              : deleteStatus as DrinkingStatus,
      drinksMap: drinksMap == const $CopyWithPlaceholder() || drinksMap == null
          ? _value.drinksMap
          // ignore: cast_nullable_to_non_nullable
          : drinksMap as Map<String, Drinking>,
      ids: ids == const $CopyWithPlaceholder() || ids == null
          ? _value.ids
          // ignore: cast_nullable_to_non_nullable
          : ids as List<String>,
    );
  }
}

extension $DrinkingStateCopyWith on DrinkingState {
  /// Returns a callable class that can be used as follows: `instanceOfDrinkingState.copyWith(...)` or like so:`instanceOfDrinkingState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DrinkingStateCWProxy get copyWith => _$DrinkingStateCWProxyImpl(this);
}
