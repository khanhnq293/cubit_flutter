import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<String>{
  CounterCubit(super.initialState);
  void increment() => emit("${state}yem ");
  void decrement() => emit("${state}khsSem ");
  void clear()=>emit("anh");
}