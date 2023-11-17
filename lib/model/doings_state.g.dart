// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doings_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DoingsStateCWProxy {
  DoingsState doings(List<Doing> doings);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DoingsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DoingsState(...).copyWith(id: 12, name: "My name")
  /// ````
  DoingsState call({
    List<Doing>? doings,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDoingsState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDoingsState.copyWith.fieldName(...)`
class _$DoingsStateCWProxyImpl implements _$DoingsStateCWProxy {
  final DoingsState _value;

  const _$DoingsStateCWProxyImpl(this._value);

  @override
  DoingsState doings(List<Doing> doings) => this(doings: doings);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DoingsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DoingsState(...).copyWith(id: 12, name: "My name")
  /// ````
  DoingsState call({
    Object? doings = const $CopyWithPlaceholder(),
  }) {
    return DoingsState(
      doings: doings == const $CopyWithPlaceholder() || doings == null
          ? _value.doings
          // ignore: cast_nullable_to_non_nullable
          : doings as List<Doing>,
    );
  }
}

extension $DoingsStateCopyWith on DoingsState {
  /// Returns a callable class that can be used as follows: `instanceOfDoingsState.copyWith(...)` or like so:`instanceOfDoingsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DoingsStateCWProxy get copyWith => _$DoingsStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoingsState _$DoingsStateFromJson(Map<String, dynamic> json) => DoingsState(
      doings: (json['doings'] as List<dynamic>?)
              ?.map((e) => Doing.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DoingsStateToJson(DoingsState instance) =>
    <String, dynamic>{
      'doings': instance.doings,
    };
