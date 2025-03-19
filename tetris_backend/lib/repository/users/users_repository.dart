import 'package:drift/drift.dart';
import 'package:tetris_backend/repository/users/models/models.dart';
import 'package:tetris_backend/utils/database.dart';

class UsersRepository {
  UsersRepository({required this.db});

  final Database db;

  Future<User> createUser(String nickname) async {
    final dbUser = await db.into(db.users).insertReturning(
          UsersCompanion(nickname: Value(nickname)),
        );
    return User.fromDto(dbUser);
  }

  Future<User> getUser(String nickname) async {
    final res = await (db.select(db.users)
          ..where((tbl) => tbl.nickname.equals(nickname)))
        .get();
    if (res.isEmpty) {
      throw NotExistsException('User with id $nickname not found');
    }
    return User.fromDto(res.first);
  }

  Future<User> getOrCreateUser(String nickname) async {
    try {
      return await getUser(nickname);
    } on NotExistsException {
      return createUser(nickname);
    }
  }
}
