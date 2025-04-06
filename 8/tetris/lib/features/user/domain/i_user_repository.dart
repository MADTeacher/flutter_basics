import 'user_entity.dart';

/// Интерфейс репозитория пользователя
abstract interface class IUserRepository {
  /// Создание пользователя
  /// Если пользователь с таким именем уже существует,
  /// то возвращается существующий пользователь
  Future<UserEntity> createUser(String username);

  // Установка счета пользователя,
  Future<UserEntity> setScores(String username, int scores);

  /// Получение пользователя из локального хранилища
  Future<UserEntity?> getUserFromStorage();

  /// Удаление пользователя из локального хранилища
  Future<void> deleteUserFromStorage();
}
