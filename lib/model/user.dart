import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String userName;
  String password;

  User(this.userName, this.password);

  factory User.initial() => User("", "");

  User copyWith({String? userName, String? password}) {
    return User(userName ?? this.userName, password ?? this.password);
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
