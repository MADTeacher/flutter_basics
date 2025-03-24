import 'package:flutter/foundation.dart';

/// Сущность пользователя
@immutable
class UserEntity {
  /// Имя пользователя
  final String username;

  /// Счет пользователя
  final String scores;

  const UserEntity({
    required this.username,
    required this.scores,
  });

  /// Копирование объекта
  UserEntity copyWith({
    String? username,
    String? scores,
  }) {
    return UserEntity(
      username: username ?? this.username,
      scores: scores ?? this.scores,
    );
  }

  /// Правильное сравнение объектов
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserEntity &&
        other.username == username &&
        other.scores == scores;
  }

  /// Хэш-код объекта
  @override
  int get hashCode => username.hashCode ^ scores.hashCode;
}
