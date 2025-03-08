import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

part 'database.g.dart';

// Определяем таблицу пользователей
@DataClassName('User')
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nickname => text().withLength(min: 1, max: 50)();
  TextColumn get email => text().unique()();
}

// Определяем таблицу результатов игр
@DataClassName('GameResult')
class GameResults extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer()();
  IntColumn get result => integer()();
}

// Определяем базу данных
@DriftDatabase(tables: [Users, GameResults])
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
