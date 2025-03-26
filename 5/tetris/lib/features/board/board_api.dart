import 'dart:convert';

import 'package:tetris/features/board/board_entity.dart';
import 'package:tetris/features/http/i_http_client.dart';

class BoardApi {
  final IHttpClient httpClient;

  BoardApi({required this.httpClient});

  Future<List<BoardEntity>> fetchUsers() async {
    final response = await httpClient.get('/games/scores/');

    if (response.statusCode != 200) {
      throw Exception(
          'Ошибка при загрузке пользователей: ${response.statusCode}');
    }
    List<dynamic> data = json.decode(response.body);
    return data.map((item) {
      final userName = (item as Map<String, dynamic>)['user']['nickname'];
      final scores = (item)['score']['score'];
      return BoardEntity.fromJson({
        'username': userName,
        'scores': scores,
      });
    }).toList();
  }
}
