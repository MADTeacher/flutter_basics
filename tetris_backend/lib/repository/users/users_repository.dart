import 'package:drift/drift.dart';
import 'package:tetris_backend/repository/users/models/models.dart';
import 'package:tetris_backend/utils/database.dart';

class UsersRepository {
  UsersRepository({required this.db});

  final Database db;

  Future<User> createUser(String username) async {
    final dbUser = await db.into(db.users).insertReturning(
          UsersCompanion(username: Value(username)),
        );
    return User.fromDto(dbUser);
  }

  Future<User> setScore(String username, int score) async {
    final updatedUser = await (db.update(db.users)
          ..where((tbl) => tbl.username.equals(username)))
        .writeReturning(
      UsersCompanion(score: Value(score), updatedAt: Value(DateTime.now())),
    );
    return User.fromDto(updatedUser.first);
  }

  Future<User> getUser(String username) async {
    final res = await (db.select(db.users)
          ..where((tbl) => tbl.username.equals(username)))
        .get();
    if (res.isEmpty) {
      throw NotExistsException('User with id $username not found');
    }
    return User.fromDto(res.first);
  }

  Future<List<User>> getUsers() async {
    final res = await db.select(db.users).get();
    return res.map((e) => User.fromDto(e)).toList();
  }

  Future<User> getOrCreateUser(String username) async {
    try {
      return await getUser(username);
    } on NotExistsException {
      return createUser(username);
    }
  }
}
