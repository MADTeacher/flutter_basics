import 'package:flutter/foundation.dart';

import '../domain/leaderboard_entity.dart';

/// Data Transfer Object для лучших результатов
@immutable
final class LeaderboardDto {
  final int id;
  final String username;
  final int score;

  const LeaderboardDto({
    required this.id,
    required this.username,
    required this.score,
  });

  /// Создание объекта из JSON
  /// [json] - JSON-объект, полученный из API бэкенда
  factory LeaderboardDto.fromJson(Map<String, dynamic> json) {
    return LeaderboardDto(
      id: json['id'] as int,
      username: json['username'] as String,
      score: json['score'] ?? 0,
    );
  }

  /// Преобразование DTO в сущность
  /// [LeaderboardEntity] - сущность, которая используется в приложении
  LeaderboardEntity toEntity() {
    return LeaderboardEntity(
      id: id,
      username: username,
      score: score,
    );
  }
}
