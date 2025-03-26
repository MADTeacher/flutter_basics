import 'package:tetris/features/leaderboard/domain/entity/leaderboard_entity.dart';
import 'package:tetris/features/leaderboard/domain/repository/i_leaderboard_repository.dart';

/// Реализация бизнес логики в bloc
class LeaderboardBloc {
  final ILeaderboardRepository repository;

  LeaderboardBloc({required this.repository});

  /// Преобразование события в состояние
  Future<Iterable<LeaderboardEntity>> fetchLeaderboard() async {
    return await repository.fetchLeaderboard();
  }
}
