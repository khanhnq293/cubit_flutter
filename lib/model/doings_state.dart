
import 'package:bloc_project/model/doing.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'doings_state.g.dart';
@CopyWith()
@JsonSerializable()
class DoingsState extends Equatable {
  final List<Doing> doings;
  const DoingsState({this.doings = const [],});

  factory DoingsState.fromJson(Map<String, dynamic> json) =>
      _$DoingsStateFromJson(json);

  Map<String, dynamic> toJson() => _$DoingsStateToJson(this);

  @override
  List<Object?> get props => [doings];
}
