import 'dart:convert';

import 'package:tetris/app/http/i_http_client.dart';
import 'user_dto.dart';
import '../domain/i_user_repository.dart';
import '../domain/user_entity.dart';

/// Репозиторий для работы с пользователем
final class UserRepository implements IUserRepository {
  final IHttpClient httpClient;

  UserRepository({required this.httpClient});

  @override
  Future<UserEntity> createUser(String username) async {
    // Получение данных
    final response = await httpClient.post('/users/',
        body: json.encode({'username': username}));

    // Проверка статуса ответа
    if (response.statusCode != 200) {
      throw Exception(
          'Ошибка при создании пользователя: ${response.statusCode}');
    }

    // Декодирование данных
    final responseBody = await response.transform(utf8.decoder).join();
    final data = json.decode(responseBody);

    // Преобразование данных в список сущностей
    final userEntity = UserDto.fromJson(data).toEntity();

    return userEntity;
  }

  @override
  Future<UserEntity> setScores(String username, int scores) async {
    final response = await httpClient.put(
      '/users/scores/',
      body: json.encode({
        'username': username,
        'score': scores,
      }),
    );

    // Проверка статуса ответа
    if (response.statusCode != 200) {
      throw Exception(
          'Ошибка при обновлении пользователя: ${response.statusCode}');
    }

    // Декодирование данных
    final responseBody = await response.transform(utf8.decoder).join();
    final data = json.decode(responseBody);

    // Преобразование данных в список сущностей
    final userEntity = UserDto.fromJson(data).toEntity();
    return userEntity;
  }
}
