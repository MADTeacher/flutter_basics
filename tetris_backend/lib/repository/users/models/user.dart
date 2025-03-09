import 'package:tetris_backend/utils/database.dart';

class User {
  User({
    required this.id,
    required this.nickname,
    required this.email,
  });

  final int id;
  final String nickname;
  final String email;

  Map<String, dynamic> toJson() => {
        'id': id,
        'nickname': nickname,
        'email': email,
      };

  factory User.fromDto(UserDto dto) => User(
        id: dto.id,
        nickname: dto.nickname,
        email: dto.email,
      );
}
