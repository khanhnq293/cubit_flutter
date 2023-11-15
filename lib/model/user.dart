import 'dart:convert';

class User {
  String userName;
  String password;

  User(this.userName, this.password);

  factory User.initial() => User("", "");

  User copyWith({String? userName, String? password}) {
    return User(userName ?? this.userName, password ?? this.password);
  }

  factory User.fromJson(String json) {
    final Map<String, dynamic> user = jsonDecode(json);
    return User(user['userName'], user['password']);
  }

  String toJson() => '{"userName": "$userName", "password": "$password"}';
}
