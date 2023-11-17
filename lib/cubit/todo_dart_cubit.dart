import 'package:bloc_project/model/doing.dart';
import 'package:bloc_project/model/doings_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class TodoDartCubit extends HydratedCubit<DoingsState> {
  TodoDartCubit() : super(const DoingsState([]));

  void addDoing(Doing todo) {
    emit(DoingsState([todo, ...state.doings]));
  }

  void deleteDoing(int index) {
    List<Doing> newState = List.from(state.doings);
    newState.removeAt(index);
    emit(DoingsState(newState));
  }

  void updateDoingTitle(int index, Doing newTodo) {
    List<Doing> newState = List.from(state.doings);
    for (int i = 0; i < newState.length; i++) {
      if (i == index) {
        newState[i] = newTodo;
      }
    }
    emit(DoingsState(newState));
  }

  void updateDoingDone(int index, bool isDone) {
    List<Doing> newState = List.from(state.doings);
    for (int i = 0; i < newState.length; i++) {
      if (i == index) {
        newState[i].isDone = isDone;
      }
    }
    emit(DoingsState(newState));
  }

  @override
  DoingsState? fromJson(Map<String, dynamic> json) {
    print("fromJson ${json}");
    return DoingsState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(DoingsState state) {
    print("toJson $state");
    DoingsState doingsState = state;
    return doingsState.toJson(state);
  }
}
