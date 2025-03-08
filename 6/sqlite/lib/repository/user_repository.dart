import 'package:sqflite/sqflite.dart';

class UserRepository {
  UserRepository({
    required this.db,
  });

  final Database db;

  Future<void> init() async {
    await db.execute('''
    CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        age INTEGER
    );
    ''');
  }

  Future<void> createUser(CreateUserDto user) async {
    await db.insert('users', user.toMap());
  }
}

class CreateUserDto {
  CreateUserDto({
    required this.name,
    required this.email,
    required this.age,
  });

  final String name;
  final String email;
  final int age;

  factory CreateUserDto.fromMap(Map<String, dynamic> map) {
    return CreateUserDto(
      name: map['name'] as String,
      email: map['email'] as String,
      age: map['age'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'age': age,
    };
  }
}
