import 'package:bloc_project/model/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<User> users = [
  User("khanh", "123123123"),
  User("qweewq", "123123123"),
  User("asddsa", "123123123")
];

class UsersCubit extends Cubit<List<User>> {
  UsersCubit() : super(users);
  void signUp(User user) => emit([...state, user]);
  List<User> getUsers() => state;
  }
