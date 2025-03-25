import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

part 'database.g.dart';

// Определяем таблицу пользователей
@DataClassName('UserDto')
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get score => integer().nullable()();
  TextColumn get username => text().withLength(min: 1, max: 50)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

// Определяем базу данных
@DriftDatabase(tables: [Users])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Закрыть базу данных
  @override
  Future<void> close() async {
    await super.close();
  }
}

// Функция для подключения к базе данных
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final file = File('app_database.sqlite');
    return NativeDatabase(file);
  });
}

class NotExistsException implements Exception {
  NotExistsException(this.message);
  final String message;
}
