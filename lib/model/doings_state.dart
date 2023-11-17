
import 'package:bloc_project/model/doing.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'doings_state.g.dart';

@JsonSerializable()
class DoingsState extends Equatable {
  final List<Doing> doings;


  const DoingsState(this.doings);

  factory DoingsState.fromJson(Map<String, dynamic> json) =>
      _$DoingsStateFromJson(json);

  Map<String, dynamic> toJson() => _$DoingsStateToJson(this);

  @override
  List<Object?> get props => [doings];
}
