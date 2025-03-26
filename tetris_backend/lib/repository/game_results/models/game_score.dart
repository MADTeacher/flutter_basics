import 'package:tetris_backend/utils/database.dart';

class GameScore {
  const GameScore({
    required this.id,
    required this.userId,
    required this.score,
    required this.createdAt,
  });

  final int id;
  final int userId;
  final int score;
  final DateTime createdAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'score': score,
        'createdAt': createdAt.toIso8601String(),
      };

  factory GameScore.fromDto(GameScoreDto dto) => GameScore(
        id: dto.id,
        userId: dto.userId,
        score: dto.score,
        createdAt: dto.createdAt,
      );
}

class CreateGameScore {
  CreateGameScore({
    required this.userId,
    required this.score,
  });

  final int userId;
  final int score;
}
