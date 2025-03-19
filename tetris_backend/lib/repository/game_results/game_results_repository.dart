import 'package:drift/drift.dart';
import 'package:tetris_backend/repository/game_results/models/models.dart';
import 'package:tetris_backend/repository/users/models/models.dart';
import 'package:tetris_backend/utils/database.dart';

class GameResultsRepository {
  GameResultsRepository(this.db);
  final Database db;

  Future<GameScore> create(CreateGameScore score) async {
    final dbGameScore = await db.into(db.gameScores).insertReturning(
          GameScoresCompanion(
            userId: Value(score.userId),
            score: Value(score.score),
          ),
        );

    return GameScore.fromDto(dbGameScore);
  }

  Future<List<UserWithScore>> getUsersWithScores() async {
    final query = db.select(db.users).join([
      innerJoin(
        db.gameScores,
        db.gameScores.userId.equalsExp(db.users.id),
      )
    ])
      ..addColumns([db.gameScores.score.max()])
      ..groupBy([db.users.id])
      ..orderBy([OrderingTerm.desc(db.gameScores.score.max())]);

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
