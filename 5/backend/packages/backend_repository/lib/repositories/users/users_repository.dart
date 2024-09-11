import 'package:backend_repository/exceptions/exceptions.dart';
import 'package:backend_repository/repositories/users/users.dart';

class UsersRepository {
  Future<List<User>> getUsers() async {
    return _mockUsers;
  }

  Future<User> getUser(int id) async {
    final userIndex = _mockUsers.indexWhere((e) => e.id == id);
    if (userIndex < 0) throw NotFoundException();
    return _mockUsers[userIndex];
  }

  Future<bool> isUserExist(int id) async {
    final userIndex = _mockUsers.indexWhere((e) => e.id == id);
    return userIndex >= 0;
  }

  Future<User> createUser(User user) async {
    return user;
  }

  Future<void> delete(int id) async {
    final userExist = await isUserExist(id);
    if (!userExist) throw NotFoundException();
  }

  static const _mockUsers = <User>[
    User(
      id: 1,
      name: 'Алексей',
      surname: 'Иванович',
      lastname: 'Смирнов',
      email: 'alexey.smirnov@example.com',
      age: 32,
      height: 180.5,
      weight: 75,
    ),
    User(
      id: 2,
      name: 'Мария',
      surname: 'Петровна',
      lastname: 'Иванова',
      email: 'maria.ivanova@example.com',
      age: 28,
      height: 165.2,
      weight: 60,
    ),
    User(
      id: 3,
      name: 'Дмитрий',
      surname: 'Алексеевич',
      lastname: 'Варинов',
      email: 'dmitry.varinov@example.com',
      age: 40,
      height: 155,
      weight: 80,
    ),
    User(
      id: 4,
      name: 'Екатерина',
      surname: 'Владимировна',
      lastname: 'Федорова',
      email: 'ekaterina.fedorova@example.com',
      age: 35,
      height: 168,
      weight: 65,
    ),
    User(
      id: 5,
      name: 'Сергей',
      surname: 'Николаевич',
      lastname: 'Морозов',
      email: 'sergey.morozov@example.com',
      age: 45,
      height: 182,
      weight: 85,
    ),
  ];
}
