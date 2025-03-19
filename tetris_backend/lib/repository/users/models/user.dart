import 'package:tetris_backend/utils/database.dart';

class User {
  User({
    required this.id,
    required this.nickname,
  });

  final int id;
  final String nickname;

  Map<String, dynamic> toJson() => {'id': id, 'nickname': nickname};

  factory User.fromDto(UserDto dto) => User(id: dto.id, nickname: dto.nickname);
}
