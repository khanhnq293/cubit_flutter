import 'package:bloc_project/cubit/drinking_cubit/cubit/drinking_state.dart';
import 'package:bloc_project/model/drinking.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class DrinkingCubit extends Cubit<DrinkingState> {
  DrinkingCubit() : super(const DrinkingState());
  void addDrinking(Drinking drinking) {
    emit(state.copyWith(addStatus: DrinkingStatus.start));
    Map<String, Drinking> newDrinksMap = Map.from(state.drinksMap);
    newDrinksMap[drinking.id] = drinking;
    List<String> newIds = [];
    for (int i = 0; i < newDrinksMap.length; i++) {
      newIds.add(newDrinksMap.keys.toString());
    }
    emit(state.copyWith(
      drinksMap: newDrinksMap,
      ids: newIds,
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
    Map<String, Drinking> newDrinkMap = Map.from(state.drinksMap);
    newDrinkMap.remove(id);
    List<String> newIds = List.from(state.ids);
    newIds.remove(id);
    emit(state.copyWith(
        drinksMap: newDrinkMap,
        ids: newIds,
        deleteStatus: DrinkingStatus.success));
  }
}
