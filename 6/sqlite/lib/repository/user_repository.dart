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

  /// Создание нового пользователя
  Future<void> createUser(CreateUserDto user) async {
    await db.insert('users', user.toMap());
  }

  /// Получение всех пользователей
  Future<List<User>> getUsers() async {
    final data = await db.query('users');
    return data.map((e) => User.fromMap(e)).toList();
  }

  /// Получение пользователя по id
  Future<User> getUser(int id) async {
    final data = await db.query('users', where: 'id = ?', whereArgs: [id]);
    if (data.isEmpty) throw Exception('User not found');
    return User.fromMap(data.first);
  }

  Future<List<User>> getYoungUsers() async {
    final data = await db.query('users', where: 'age < ?', whereArgs: [18]);
    return data.map((e) => User.fromMap(e)).toList();
  }

  /// Обновление пользователя
  Future<void> updateUser(User user) async {
    await db.update(
      'users',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  /// Удаление пользователя
  Future<void> deleteUser(int id) async {
    await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  /// Удаление всех пользователей
  Future<void> deleteAllUsers() async {
    await db.delete('users');
  }
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
  });

  final int id;
  final String name;
  final String email;
  final int age;

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      age: map['age'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'age': age,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, age: $age}';
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

/// Метод создания нового пользователя
Future<void> _addUser() async {
  final db = await openDatabase('app_database.db');
  await db.insert('users', {
    'name': 'Елена',
    'email': 'elena@gmail.com',
    'age': 25,
  });
}

/// Метод создания нового пользователя
Future<void> _addUserBasic() async {
  final db = await openDatabase('app_database.db');
  await db.execute(
    'INSERT INTO users (name, email, age) VALUES (?, ?, ?)',
    ['Елена1', 'elena1@gmail.com', 25],
  );
}

Future<void> _getUsersBasic() async {
  final db = await openDatabase('app_database.db');
  final data = await db.rawQuery('SELECT * FROM users');
  print(data);
}

Future<void> _updateUserBasic(User user) async {
  final db = await openDatabase('app_database.db');
  await db.rawQuery(
    "UPDATE users SET name = ?, email = ?, age = ? WHERE id = ?",
    [user.name, user.email, user.age, user.id],
  );
}

Future<void> _deleteUserBasic(int id) async {
  final db = await openDatabase('app_database.db');
  await db.rawDelete('DELETE FROM users WHERE id = ?', [id]);
}
