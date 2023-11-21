import 'package:bloc_project/model/drinking.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
part 'drinking_state.g.dart';

enum DrinkingStatus { init, start, success, fail }

@CopyWith()
class DrinkingState extends Equatable {
  final Map<String, Drinking> drinksMap;
  final List<String> ids;
  final DrinkingStatus convertStatus;
  final DrinkingStatus addStatus;
  final DrinkingStatus deleteStatus;
  const DrinkingState({
    this.drinksMap = const {},
    this.ids = const [],
    this.convertStatus = DrinkingStatus.init,
    this.addStatus = DrinkingStatus.init,
    this.deleteStatus = DrinkingStatus.init,
  });

  @override
  List<Object> get props => [
        drinksMap,
        ids,
        convertStatus,
        addStatus,
        deleteStatus,
      ];
}
