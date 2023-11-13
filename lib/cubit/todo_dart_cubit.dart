import 'package:bloc_project/model/doing.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoDartCubit extends Cubit<List<Doing>> {
  TodoDartCubit() : super([]);

  int getStateLength() => state.length;

  List<Doing> getDoings() => state;

  void addDoing(Doing todo) => emit([todo,...state]);

  void deleteDoing(int index) {
    List<Doing> newState = List.from(state);
    newState.removeAt(index);
    emit(newState);
  }

  void updateDoingTitle(int index, Doing newTodo) {
    List<Doing> newState = List.from(state);
    for (int i = 0; i < newState.length; i++) {
      if (i == index) {
        newState[i] = newTodo;
      }
    }
    emit(newState);
  }
  void updateDoingDone(int index,bool isDone){
    List<Doing> newState = List.from(state);
    for (int i = 0; i < newState.length; i++) {
      if (i == index) {
        newState[i].isDone = isDone;
      }
    }
    emit(newState);
  }
}
