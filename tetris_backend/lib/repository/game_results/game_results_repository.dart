import 'package:drift/drift.dart';
import 'package:tetris_backend/repository/game_results/models/create_game_result.dart';
import 'package:tetris_backend/utils/database.dart';

class GameResultsRepository {
  GameResultsRepository(this.db);
  final Database db;

  Future<GameResult> create(CreateGameResult gameResult) async {
    final created = await db.into(db.gameResults).insertReturning(
          GameResultsCompanion(
            userId: Value(gameResult.usertId),
            result: Value(gameResult.result),
          ),
        );
    return created;
  }
}
