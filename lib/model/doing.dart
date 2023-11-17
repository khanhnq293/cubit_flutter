import 'package:json_annotation/json_annotation.dart';

part 'doing.g.dart';

@JsonSerializable()
class Doing {
  final String name;
  final bool isDone;
  final DateTime createAtTime;

  const Doing(this.name, this.isDone, this.createAtTime);

  factory Doing.fromJson(Map<String, dynamic> json) => _$DoingFromJson(json);

  Map<String, dynamic> toJson() => _$DoingToJson(this);
}
