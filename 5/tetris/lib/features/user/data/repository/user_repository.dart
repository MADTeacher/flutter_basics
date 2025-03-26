import 'dart:convert';

import 'package:tetris/features/http/i_http_client.dart';
import 'package:tetris/features/user/data/user_dto.dart';
import 'package:tetris/features/user/domain/entity/user_entity.dart';

import '../../domain/repository/i_user_repository.dart';

/// {@template UserRepository}
///  Репозиторий для работы с пользователем
/// {@endtemplate}
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
    final data = json.decode(response.body);

    // Преобразование данных в список сущностей
    final userEntity = UserDto.fromJson({
      'id': data['id'],
      'username': data['username'],
      'score': data['score'] ?? 0,
    }).toEntity();

    return userEntity;
  }

  @override
  Future<UserEntity> setScores(String username, int scores) async {
    final response = await httpClient.put(
      '/users/scores/',
      body: json.encode({
        'username': username,
        'scores': scores,
      }),
    );

    // Проверка статуса ответа
    if (response.statusCode != 200) {
      throw Exception(
          'Ошибка при обновлении пользователя: ${response.statusCode}');
    }

    // Декодирование данных
    final data = json.decode(response.body);

    // Преобразование данных в список сущностей
    final userEntity = UserDto.fromJson({
      'id': data['id'],
      'username': data['username'],
      'score': data['score'] ?? 0,
    }).toEntity();

    return userEntity;
  }
}
