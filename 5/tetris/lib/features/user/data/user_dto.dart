import 'package:tetris/features/user/domain/entity/user_entity.dart';

/// Data Transfer Object для парсинга данных пользователя
final class UserDto {
  final int id;
  final String username;
  final int score;

  const UserDto({
    required this.id,
    required this.username,
    required this.score,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'] as int,
      username: json['username'] as String,
      score: json['score'] ?? 0,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      username: username,
      score: score,
    );
  }
}
