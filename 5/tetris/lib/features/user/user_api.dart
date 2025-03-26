import 'dart:io';

import 'package:tetris/features/http/i_http_client.dart';
import 'package:tetris/features/user/user_entity.dart';

class UserApi {
  final IHttpClient httpClient;

  UserApi({required this.httpClient});

  Future<UserEntity> createUser({
    required String username,
    required String scores,
  }) async {
    final response = await httpClient.post('/games/scores/', body: {
      'username': username,
      'scores': scores,
    });

    if (response.statusCode != 200) {
      throw HttpException(
          'Ошибка при создании пользователей: ${response.statusCode}');
    }
    return UserEntity(
      username: username,
      scores: scores,
    );
  }
}
