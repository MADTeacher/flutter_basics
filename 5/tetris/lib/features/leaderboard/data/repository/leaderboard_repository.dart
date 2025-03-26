import 'dart:convert';

import 'package:tetris/features/http/i_http_client.dart';
import 'package:tetris/features/leaderboard/data/leaderboard_dto.dart';
import 'package:tetris/features/leaderboard/domain/entity/leaderboard_entity.dart';

import '../../domain/repository/i_leaderboard_repository.dart';

/// {@template LeaderboardRepository}
///  Реализация репозитория для таблицы лидеров.
/// {@endtemplate}
final class LeaderboardRepository implements ILeaderboardRepository {
  final IHttpClient httpClient;

  LeaderboardRepository({required this.httpClient});

  @override
  Future<Iterable<LeaderboardEntity>> fetchLeaderboard() async {
    // Получение данных
    final response = await httpClient.get('/users/');

    // Проверка статуса ответа
    if (response.statusCode != 200) {
      throw Exception(
          'Ошибка при загрузке пользователей: ${response.statusCode}');
    }

    // Декодирование данных
    final responseBody = await response.transform(utf8.decoder).join();
    final Iterable data = json.decode(responseBody);

    // Преобразование данных в список сущностей
    final resList = data.map((item) {
      return LeaderboardDto.fromJson(item).toEntity();
    }).toList();

    return resList;
  }
}
