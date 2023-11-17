// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doing.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DoingCWProxy {
  Doing createAtTime(DateTime createAtTime);

  Doing isDone(bool isDone);

  Doing name(String name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Doing(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Doing(...).copyWith(id: 12, name: "My name")
  /// ````
  Doing call({
    DateTime? createAtTime,
    bool? isDone,
    String? name,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDoing.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDoing.copyWith.fieldName(...)`
class _$DoingCWProxyImpl implements _$DoingCWProxy {
  final Doing _value;

  const _$DoingCWProxyImpl(this._value);

  @override
  Doing createAtTime(DateTime createAtTime) => this(createAtTime: createAtTime);

  @override
  Doing isDone(bool isDone) => this(isDone: isDone);

  @override
  Doing name(String name) => this(name: name);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Doing(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Doing(...).copyWith(id: 12, name: "My name")
  /// ````
  Doing call({
    Object? createAtTime = const $CopyWithPlaceholder(),
    Object? isDone = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return Doing(
      createAtTime:
          createAtTime == const $CopyWithPlaceholder() || createAtTime == null
              ? _value.createAtTime
              // ignore: cast_nullable_to_non_nullable
              : createAtTime as DateTime,
      isDone: isDone == const $CopyWithPlaceholder() || isDone == null
          ? _value.isDone
          // ignore: cast_nullable_to_non_nullable
          : isDone as bool,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
    );
  }
}

extension $DoingCopyWith on Doing {
  /// Returns a callable class that can be used as follows: `instanceOfDoing.copyWith(...)` or like so:`instanceOfDoing.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DoingCWProxy get copyWith => _$DoingCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Doing _$DoingFromJson(Map<String, dynamic> json) => Doing(
      name: json['name'] as String,
      isDone: json['isDone'] as bool,
      createAtTime: DateTime.parse(json['createAtTime'] as String),
    );

Map<String, dynamic> _$DoingToJson(Doing instance) => <String, dynamic>{
      'name': instance.name,
      'isDone': instance.isDone,
      'createAtTime': instance.createAtTime.toIso8601String(),
    };
