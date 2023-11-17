import 'package:bloc_project/model/doing.dart';
import 'package:bloc_project/model/doings_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class TodoDartCubit extends HydratedCubit<DoingsState> {
  TodoDartCubit() : super(const DoingsState());

  void addDoing(Doing todo) {
    emit(DoingsState(doings: [todo, ...state.doings]));
  }

  void deleteDoing(int index) {
    List<Doing> newState = state.doings;
    newState.removeAt(index);
    emit(DoingsState(doings: newState));
  }

  void updateDoingTitle(int index, Doing newTodo) {
    List<Doing> newState = state.doings;
    newState[index] = newTodo;
    emit(DoingsState(doings: newState));
  }

  void updateDoingDone(int index, bool isDone) {
    List<Doing> newState = List.from(state.doings);
    Doing doing = newState[index].copyWith(isDone: isDone);
    newState[index] = doing;
    emit(DoingsState(doings: newState));
  }

  @override
  DoingsState? fromJson(Map<String, dynamic> json) {
    return DoingsState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(DoingsState state) {
    return state.toJson();
  }
}
