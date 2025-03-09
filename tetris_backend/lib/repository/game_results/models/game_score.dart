import 'package:tetris_backend/utils/database.dart';

class GameScore {
  const GameScore({
    required this.id,
    required this.userId,
    required this.result,
    required this.createdAt,
  });

  final int id;
  final int userId;
  final int result;
  final DateTime createdAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'result': result,
        'createdAt': createdAt.toIso8601String(),
      };

  factory GameScore.fromDto(GameScoreDto dto) => GameScore(
        id: dto.id,
        userId: dto.userId,
        result: dto.result,
        createdAt: dto.createdAt,
      );
}
