import 'package:bloc_project/cubit/drinking_cubit/cubit/drinking_state.dart';
import 'package:bloc_project/model/drinking.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class DrinkingCubit extends Cubit<DrinkingState> {
  DrinkingCubit() : super(const DrinkingState());
  void addDrinking(Drinking drinking) {
    emit(state.copyWith(addStatus: DrinkingStatus.start));
    state.drinksMap[drinking.id] = Drinking(
        id: drinking.id,
        drinkingName: drinking.drinkingName,
        sugar: drinking.sugar,
        ice: drinking.ice);
    state.ids.add(drinking.id);
    emit(state.copyWith(
      drinksMap: state.drinksMap,
      ids: state.ids,
      addStatus: DrinkingStatus.success,
    ));
  }

  void convertList(List<Drinking> drinks) {
    emit(state.copyWith(convertStatus: DrinkingStatus.start));
    Map<String, Drinking> mapFromList = {
      for (var item in drinks) item.id: item
    };
    List<String> newIds = [];
    for (var element in drinks) {
      newIds.add(element.id);
    }

    emit(state.copyWith(
      drinksMap: mapFromList,
      ids: newIds,
      convertStatus: DrinkingStatus.success,
    ));
  }

  void deleteDrinking(String id) {
    emit(state.copyWith(deleteStatus: DrinkingStatus.start));
    state.drinksMap.remove(id);
    state.ids.remove(id);
    emit(state.copyWith(
        drinksMap: state.drinksMap,
        ids: state.ids,
        deleteStatus: DrinkingStatus.success));
  }
}
