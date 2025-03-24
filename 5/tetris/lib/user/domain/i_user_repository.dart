import 'package:tetris/user/domain/entity/user_entity.dart';

/// Интерфейс репозитория пользователей
abstract interface class IUserRepository {
  /// Создание пользователя,
  Future<UserEntity> createUser(String username, String scores);

  /// Получение списка пользователей с наибольшим количеством очков
  Future<List<UserEntity>> fetchUsers();
}
