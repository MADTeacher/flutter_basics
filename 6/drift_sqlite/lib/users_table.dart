import 'package:drift/drift.dart';
import 'package:drift_sqlite/database.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().nullable()();
  TextColumn get email => text().named("email")();
  IntColumn get age => integer()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

Future<void> createUser() async {
  final db = AppDatabase();
  final user = await db.into(db.users).insert(
        UsersCompanion(
          name: const Value('Василий'),
          email: Value('vasily@example.com'),
          age: const Value(30),
        ),
      );
  print(user);
}

Future<void> getUsers() async {
  final db = AppDatabase();
  final users = await db.select(db.users).get();
  for (final user in users) {
    print(user);
  }
}

Future<void> getUserById(int id) async {
  final db = AppDatabase();

  /// Создаем запрос
  /// и передаем в него таблицу, из которой будем получать данные
  final select = db.select(db.users);

  /// Добавляем к основному звпросу условия
  /// в данном случае мы получаем только одного пользователя
  select.where((u) => u.id.equals(id));

  final user = await select.getSingle();
  print(user);
}

Future<void> getFilteredUsers() async {
  final db = AppDatabase();

  /// Создаем запрос
  /// и передаем в него таблицу, из которой будем получать данные
  final select = db.select(db.users);

  /// Добавляем к основному звпросу условия

  /// Пользователи старше 18 лет но младше 30
  select.where((u) => u.age.isBetweenValues(18, 30));

  /// Пользователи, которые созданы за последние 30 дней
  select.where((u) => u.createdAt
      .isBiggerThanValue(DateTime.now().subtract(const Duration(days: 30))));

  final users = await select.get();
  print(users);
}

Future<void> getFilteredOrUsers() async {
  final db = AppDatabase();

  /// Создаем запрос
  /// и передаем в него таблицу, из которой будем получать данные
  final select = db.select(db.users);

  /// Пользователи старше 18 лет но младше 30 или созданные в системе за предидущте 30 дней
  final thirtyDaysAgo = DateTime.now().subtract(const Duration(days: 30));
  select.where(
    (u) =>
        u.age.isBetweenValues(18, 30) |
        u.createdAt.isBiggerThanValue(thirtyDaysAgo),
  );

  final users = await select.get();
  print(users);
}

Future<void> updateUser() async {
  final db = AppDatabase();
  await (db.update(db.users)..where((u) => u.id.equals(1))).write(
    UsersCompanion(
      name: const Value('Михаил'),
    ),
  );
}

Future<void> replaceUser() async {
  final db = AppDatabase();
  final newUser = User(
    id: 1, // id должен соответствовать id существующей записи
    name: 'Артем',
    email: 'artyom@gmail.com',
    age: 25,
    createdAt: DateTime.now(),
  );
  await db.update(db.users).replace(newUser);
}

Future<void> deleteUser() async {
  final db = AppDatabase();
  await (db.delete(db.users)..where((u) => u.id.equals(1))).go();
}
