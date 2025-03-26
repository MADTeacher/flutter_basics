import 'package:tetris/features/user/domain/entity/user_entity.dart';

/// {@template IUserRepository}
///  Интерфейс репозитория для работы с пользователем
/// {@endtemplate}
abstract interface class IUserRepository {
  /// Создание пользователя
  Future<UserEntity> createUser(String username);
  // Установка счета пользователя
  Future<UserEntity> setScores(String username, int scores);
}
