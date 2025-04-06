import 'dart:convert';

import 'package:tetris/app/http/i_http_client.dart';
import 'package:tetris/app/storage/i_storage_service.dart';
import 'user_dto.dart';
import '../domain/i_user_repository.dart';
import '../domain/user_entity.dart';

/// Репозиторий для работы с пользователем
final class UserRepository implements IUserRepository {
  final IHttpClient httpClient;
  final IStorageService storageService;

  UserRepository({
    required this.httpClient,
    required this.storageService,
  });

  @override
  Future<UserEntity> createUser(String username) async {
    /// JSON-данные c отложенной инициализацией
    /// Получаем данные от сервера или создаем пользователя с id = 0 и score = 0
    late final Map<String, dynamic> resultJson;

    // Получение данных
    try {
      final response = await httpClient.post(
        '/users/',
        body: {"username": username},
      );
      // Проверка статуса ответа
      if (response.statusCode != 200) {
        throw Exception(
          'Ошибка при создании пользователя: ${response.statusCode}',
        );
      }
      resultJson = json.decode(response.body);
    } on Object catch (_) {
      // Если произошла ошибка, то создаем пользователя с id = 0 и score = 0
      // и сохраняем его в локальном хранилище
      resultJson = {
        'id': 0,
        'username': username,
        'score': 0,
      };
    }
    final userDto = UserDto.fromJson(resultJson);
    // Сохранение пользователя в локальном хранилище
    await storageService.setString(
      'user',
      jsonEncode(userDto.toJson()),
    );
    // Преобразование данных в список сущностей
    return userDto.toEntity();
  }

  @override
  Future<UserEntity> setScores(String username, int scores) async {
    /// JSON-данные c отложенной инициализацией
    /// Получаем данные от сервера или создаем пользователя с id = 0 и score = 0
    late final Map<String, dynamic> resultJson;

    try {
      final response = await httpClient.put(
        '/users/scores/',
        body: {
          'username': username,
          'score': scores,
        },
      );
      // Проверка статуса ответа
      if (response.statusCode != 200) {
        throw Exception(
          'Ошибка при обновлении пользователя: ${response.statusCode}',
        );
      }
    } on Object catch (_) {
      // Если произошла ошибка, то
      // сохраняем его в локальном хранилище
      resultJson = {
        'id': 0,
        'username': username,
        'score': scores,
      };
    }
    final userDto = UserDto.fromJson(resultJson);
    // Сохранение пользователя в локальном хранилище
    await storageService.setString(
      'user',
      jsonEncode(userDto.toJson()),
    );
    // Преобразование данных в список сущностей
    return userDto.toEntity();
  }

  @override
  Future<void> deleteUserFromStorage() async {
    // Очистка локального хранилища
    await storageService.clear();
  }

  @override
  Future<UserEntity?> getUserFromStorage() async {
    // Получение данных из локального хранилища
    final userString = storageService.getString('user');
    if (userString == null) {
      return null;
    }
    // Преобразование данных в JSON
    final userJson = json.decode(userString);
    // Преобразование JSON в DTO
    final userDto = UserDto.fromJson(userJson);
    // Преобразование DTO в сущность
    return userDto.toEntity();
  }
}
