import 'package:tetris/features/leaderboard/domain/entity/leaderboard_entity.dart';

/// {@template ILeaderboardRepository}
///  Интерфейс репозитория фичи для
///  работы с таблицей лидеров.
/// {@endtemplate}
abstract interface class ILeaderboardRepository {
  /// Получение таблицы лидеров.
  Future<Iterable<LeaderboardEntity>> fetchLeaderboard();
}
