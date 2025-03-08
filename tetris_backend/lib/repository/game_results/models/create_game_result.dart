import 'package:json_annotation/json_annotation.dart';

part 'create_game_result.g.dart';

@JsonSerializable(createToJson: false)
class CreateGameResult {
  CreateGameResult({
    required this.usertId,
    required this.result,
  });

  final int usertId;
  final int result;

  factory CreateGameResult.fromJson(Map<String, dynamic> json) =>
      _$CreateGameResultFromJson(json);
}
