import 'package:tetris/features/user/domain/entity/user_entity.dart';

import '../../domain/repository/i_user_repository.dart';

/// {@template UserMockRepository}
///  Мок - репозиторий для работы с пользователем
/// {@endtemplate}
final class UserMockRepository implements IUserRepository {
  @override
  Future<UserEntity> createUser(String username) {
    return Future.delayed(
      const Duration(seconds: 1),
      () => UserEntity(
        id: 1,
        username: username,
        score: 0,
      ),
    );
  }

  @override
  Future<UserEntity> setScores(String username, int scores) {
    return Future.delayed(
      const Duration(seconds: 1),
      () => UserEntity(
        id: 1,
        username: username,
        score: scores,
      ),
    );
  }
}
