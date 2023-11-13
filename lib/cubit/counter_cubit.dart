import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<String>{
  CounterCubit(super.initialState);
  void increment() => emit("${state}yeu em ");
  void decrement() => emit("${state}khong em ");
  void clear()=>emit("anh");
}