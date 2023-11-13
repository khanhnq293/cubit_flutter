class User {
  String userName;
  String password;

  User(this.userName, this.password);

  factory User.initial() => User("", "");

  User copyWith({
    String? userName,
    String? password
  }) {
    return User(userName ?? this.userName, password ?? this.password);
  }

}
