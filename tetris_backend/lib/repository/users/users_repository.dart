import 'package:drift/drift.dart';
import 'package:tetris_backend/repository/users/models/models.dart';
import 'package:tetris_backend/utils/database.dart';

class UsersRepository {
  UsersRepository({required this.db});

  final Database db;

  Future<User> create(CreateUser user) async {
    final created = await db.into(db.users).insertReturning(
          UsersCompanion(
            nickname: Value(user.nickname),
            email: Value(user.email),
          ),
        );
    return created;
  }

  // Получить всех пользователей
  Future<List<User>> getUsers() => db.select(db.users).get();
}
