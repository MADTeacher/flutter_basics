import '../domain/user_entity.dart';

/// Data Transfer Object для парсинга данных пользователя
final class UserDto {
  /// Идентификатор пользователя
  final int id;

  /// Имя пользователя
  final String username;

  /// Лучший счет пользователя
  final int score;

  const UserDto({
    required this.id,
    required this.username,
    required this.score,
  });

  /// Преобразование JSON в DTO
  /// [json] - JSON-данные полученные от сервера
  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'] as int,
      username: json['username'] as String,
      score: json['score'] ?? 0,
    );
  }

  /// Преобразование DTO в JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'score': score,
    };
  }

  /// Преобразование DTO в сущность [UserEntity]
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      username: username,
      score: score,
    );
  }
}
