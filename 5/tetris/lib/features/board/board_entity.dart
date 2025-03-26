// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

/// Сущность пользователя
@immutable
class BoardEntity {
  /// Имя пользователя
  final String username;

  /// Лучший счет пользователя
  final String scores;

  const BoardEntity({
    required this.username,
    required this.scores,
  });

  /// Правильное сравнение объектов
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BoardEntity &&
        other.username == username &&
        other.scores == scores;
  }

  /// Хэш-код объекта
  @override
  int get hashCode => username.hashCode ^ scores.hashCode;

  /// Создание объекта из строки
  factory BoardEntity.fromJson(Map<String, dynamic> json) {
    return BoardEntity(
      username: json['username'].toString(),
      scores: json['scores'].toString(),
    );
  }
}
