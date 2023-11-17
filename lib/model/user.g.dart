// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserCWProxy {
  User password(String password);

  User userName(String userName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `User(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// User(...).copyWith(id: 12, name: "My name")
  /// ````
  User call({
    String? password,
    String? userName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUser.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUser.copyWith.fieldName(...)`
class _$UserCWProxyImpl implements _$UserCWProxy {
  final User _value;

  const _$UserCWProxyImpl(this._value);

  @override
  User password(String password) => this(password: password);

  @override
  User userName(String userName) => this(userName: userName);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `User(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// User(...).copyWith(id: 12, name: "My name")
  /// ````
  User call({
    Object? password = const $CopyWithPlaceholder(),
    Object? userName = const $CopyWithPlaceholder(),
  }) {
    return User(
      password: password == const $CopyWithPlaceholder() || password == null
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
      userName: userName == const $CopyWithPlaceholder() || userName == null
          ? _value.userName
          // ignore: cast_nullable_to_non_nullable
          : userName as String,
    );
  }
}

extension $UserCopyWith on User {
  /// Returns a callable class that can be used as follows: `instanceOfUser.copyWith(...)` or like so:`instanceOfUser.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserCWProxy get copyWith => _$UserCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      userName: json['userName'] as String? ?? '',
      password: json['password'] as String? ?? '',
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userName': instance.userName,
      'password': instance.password,
    };
