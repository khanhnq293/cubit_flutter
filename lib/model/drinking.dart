import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'drinking.g.dart';

@CopyWith()
@JsonSerializable()
class Drinking {
  final String id;
  final String drinkingName;
  final int sugar;
  final int ice;
  Drinking(
      {required this.id,
      required this.drinkingName,
      required this.sugar,
      required this.ice});
  factory Drinking.fromJson(Map<String, dynamic> json) =>
      _$DrinkingFromJson(json);

  Map<String, dynamic> toJson() => _$DrinkingToJson(this);
}
