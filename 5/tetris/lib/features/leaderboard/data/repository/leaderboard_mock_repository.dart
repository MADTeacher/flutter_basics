import 'package:tetris/features/leaderboard/data/leaderboard_dto.dart';
import 'package:tetris/features/leaderboard/domain/entity/leaderboard_entity.dart';

import '../../domain/repository/i_leaderboard_repository.dart';

/// {@template LeaderboardMockRepository}
///  Мок-реализация репозитория для таблицы лидеров.
/// {@endtemplate}
final class LeaderboardMockRepository implements ILeaderboardRepository {
  @override
  Future<Iterable<LeaderboardEntity>> fetchLeaderboard() {
    return Future.delayed(
      const Duration(seconds: 1),
      () => [
        LeaderboardDto.fromJson({
          'id': 1,
          'username': 'User1',
          'score': 100,
        }).toEntity(),
        LeaderboardDto.fromJson({
          'id': 2,
          'username': 'User2',
          'score': 200,
        }).toEntity(),
        LeaderboardDto.fromJson({
          'id': 3,
          'username': 'User3',
          'score': 300,
        }).toEntity(),
        LeaderboardDto.fromJson({
          'id': 4,
          'username': 'User4',
          'score': 400,
        }).toEntity(),
        LeaderboardDto.fromJson({
          'id': 5,
          'username': 'User5',
          'score': 500,
        }).toEntity(),
        LeaderboardDto.fromJson({
          'id': 6,
          'username': 'User6',
          'score': 600,
        }).toEntity(),
        LeaderboardDto.fromJson({
          'id': 7,
          'username': 'User7',
          'score': 700,
        }).toEntity(),
        LeaderboardDto.fromJson({
          'id': 8,
          'username': 'User8',
          'score': 800,
        }).toEntity(),
        LeaderboardDto.fromJson({
          'id': 9,
          'username': 'User9',
          'score': 900,
        }).toEntity(),
        LeaderboardDto.fromJson({
          'id': 10,
          'username': 'User10',
          'score': 1000,
        }).toEntity(),
      ],
    );
  }
}
