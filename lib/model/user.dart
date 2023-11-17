import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@CopyWith()
@JsonSerializable()
class User {
  final String userName;
  final String password;

  User({ this.userName = '', this.password = ''});

  factory User.initial() => User();



  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
