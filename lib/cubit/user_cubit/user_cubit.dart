import 'package:bloc_project/model/user.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

List<User> users = [
  User("khanh", "123123123A"),
  User("qweewq", "123123123A"),
  User("asddsa", "123123123A")
];


class UserCubit extends HydratedCubit<User> {
  UserCubit() : super(User.initial());

  bool signIn(User user) {
    for (User element in users) {
      if (user.userName == element.userName &&
          user.password == element.password) {
        emit(state.copyWith(userName: user.userName, password: user.password));

        return true;
      }
    }
    return false;
  }

  bool signUp(User user) {
    for (User element in users) {
      if (user.userName == element.userName) {
        return false;
      }
    }
    users.add(user);
    return true;
  }

  void logout() => emit(state.copyWith(userName: "", password: ""));

  @override
  User? fromJson(Map<String, dynamic> json) {
    return User.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(User state) {
    return state.toJson();
  }
}
