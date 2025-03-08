import 'package:json_annotation/json_annotation.dart';

part 'create_user.g.dart';

@JsonSerializable(createToJson: false)
class CreateUser {
  const CreateUser({
    required this.nickname,
    required this.email,
  });

  final String nickname;
  final String email;

  factory CreateUser.fromJson(Map<String, dynamic> json) =>
      _$CreateUserFromJson(json);
}
