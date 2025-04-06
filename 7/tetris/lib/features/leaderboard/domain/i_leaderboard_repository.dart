import 'leaderboard_entity.dart';

///  Интерфейс репозитория для
///  работы с таблицей лидеров
abstract interface class ILeaderboardRepository {
  /// Получение таблицы лидеров.
  Future<Iterable<LeaderboardEntity>> fetchLeaderboard();
}
