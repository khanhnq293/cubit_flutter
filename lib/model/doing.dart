import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'doing.g.dart';

@CopyWith()
@JsonSerializable()
class Doing {
  final String name;
  final bool isDone;
  final DateTime createAtTime;

  const Doing({required this.name,required this.isDone,required this.createAtTime});

  factory Doing.fromJson(Map<String, dynamic> json) => _$DoingFromJson(json);

  Map<String, dynamic> toJson() => _$DoingToJson(this);
}
