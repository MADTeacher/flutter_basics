import 'package:tetris/features/leaderboard/domain/entity/leaderboard_entity.dart';

/// Data Transfer Object для лучших результатов
final class LeaderboardDto {
  final int id;
  final String username;
  final int score;

  const LeaderboardDto({
    required this.id,
    required this.username,
    required this.score,
  });

  factory LeaderboardDto.fromJson(Map<String, dynamic> json) {
    return LeaderboardDto(
      id: json['id'] as int,
      username: json['username'] as String,
      score: json['score'] ?? 0,
    );
  }

  LeaderboardEntity toEntity() {
    return LeaderboardEntity(
      id: id,
      username: username,
      score: score,
    );
  }
}
