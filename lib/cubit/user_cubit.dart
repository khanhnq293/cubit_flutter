import 'package:bloc_project/model/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<User> {
  UserCubit() : super(User.initial());

  void signIn(User user) =>
      emit(state.copyWith(userName: user.userName, password: user.password));

  void logout() => emit(state.copyWith(userName: "", password: ""));
}
