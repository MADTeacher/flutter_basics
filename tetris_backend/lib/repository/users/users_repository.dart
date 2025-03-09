import 'package:drift/drift.dart';
import 'package:tetris_backend/repository/users/models/models.dart';
import 'package:tetris_backend/utils/database.dart';

class UsersRepository {
  UsersRepository({required this.db});

  final Database db;

  Future<User> createUser(CreateUser user) async {
    final dbUser = await db.into(db.users).insertReturning(
          UsersCompanion(
            nickname: Value(user.nickname),
            email: Value(user.email),
          ),
        );
    return User.fromDto(dbUser);
  }

  Future<User> getUser(int id) async {
    final res =
        await (db.select(db.users)..where((tbl) => tbl.id.equals(id))).get();
    if (res.isEmpty) {
      throw NotExistsException('User with id $id not found');
    }
    return User.fromDto(res.first);
  }

  // Получить всех пользователей
  Future<List<User>> getUsers() => db
      .select(db.users)
      .get()
      .then((dbUsers) => dbUsers.map(User.fromDto).toList());

  // Проверить, существует ли пользователь с данным email
  Future<bool> containsUserWithEmail(String email) async {
    final res = await (db.select(db.users)
          ..where((tbl) => tbl.email.equals(email)))
        .get();
    return res.isNotEmpty;
  }
}
