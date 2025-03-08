import 'package:drift/drift.dart';
import 'package:tetris_backend/repository/users/models/models.dart';
import 'package:tetris_backend/utils/database.dart';

class UsersRepository {
  UsersRepository({required this.db});

  final Database db;

  Future<User> create(CreateUser user) async {
    final dto = await db.into(db.users).insertReturning(
          UsersCompanion(
            nickname: Value(user.nickname),
            email: Value(user.email),
          ),
        );
    return User.fromDto(dto);
  }

  // Получить всех пользователей
  Future<List<User>> getUsers() => db
      .select(db.users)
      .get()
      .then((dtolist) => dtolist.map(User.fromDto).toList());
}
