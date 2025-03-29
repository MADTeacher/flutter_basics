import 'dart:convert';

import 'package:tetris/app/http/i_http_client.dart';
import 'package:tetris/features/leaderboard/data/leaderboard_dto.dart';
import 'package:tetris/features/leaderboard/domain/i_leaderboard_repository.dart';
import 'package:tetris/features/leaderboard/domain/leaderboard_entity.dart';

///  Реализация репозитория для таблицы лидеров.
final class LeaderboardRepository implements ILeaderboardRepository {
  /// HTTP клиент для отправки запросов к API
  final IHttpClient httpClient;

  LeaderboardRepository({required this.httpClient});

  @override
  Future<Iterable<LeaderboardEntity>> fetchLeaderboard() async {
    // Получение данных
    final response = await httpClient.get('/users/');

    // Проверка статуса ответа
    if (response.statusCode != 200) {
      throw Exception('Ошибка при загрузке: ${response.statusCode}');
    }

    // Декодирование данных
    final responseBody = await response.transform(utf8.decoder).join();
    final Iterable data = json.decode(responseBody);

    // Преобразование данных в список сущностей
    final resList = data.map((item) {
      return LeaderboardDto.fromJson(item).toEntity();
    }).toList();

    // Возвращаем список сущностей
    return resList;
  }
}
