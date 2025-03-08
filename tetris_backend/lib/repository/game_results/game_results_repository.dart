import 'package:drift/drift.dart';
import 'package:tetris_backend/repository/game_results/models/models.dart';
import 'package:tetris_backend/repository/users/models/models.dart';
import 'package:tetris_backend/utils/database.dart';

class GameResultsRepository {
  GameResultsRepository(this.db);
  final Database db;

  Future<GameScore> create(CreateGameResult gameResult) async {
    final dto = await db.into(db.gameScores).insertReturning(
          GameScoresCompanion(
            userId: Value(gameResult.userId),
            result: Value(gameResult.result),
          ),
        );

    return GameScore.fromDto(dto);
  }

  Future<List<UserWithScore>> getUsersWithScores() async {
    final query = db.select(db.users).join([
      leftOuterJoin(
        db.gameScores,
        db.gameScores.userId.equalsExp(db.users.id),
      )
    ])
      ..addColumns([db.gameScores.result.max()])
      ..groupBy([db.users.id]);

    final result = await query.map((row) {
      final dbUser = row.readTable(db.users);
      final dbScore = row.readTable(db.gameScores);
      final user = User.fromDto(dbUser);
      final score = GameScore.fromDto(dbScore);
      return UserWithScore(user: user, score: score);
    }).get();

    return result;
  }
}
