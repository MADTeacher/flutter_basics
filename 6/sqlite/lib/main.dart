import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite/repository/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = await _initDatabase();
  runApp(MyApp(db: db));
}

/// Метод инициализации базы данных
Future<Database> _initDatabase() async {
  final db = await openDatabase('app_database.db');
  await db.execute('''
  CREATE TABLE IF NOT EXISTS users (
      id INTEGER PRIMARY KEY,
      name TEXT NOT NULL,
      email TEXT UNIQUE NOT NULL,
      age INTEGER
  );
  ''');
  return db;
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.db,
  });

  final Database db;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sqflite',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(db: db),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.db});

  final Database db;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final UserRepository _userRepository;

  List<User> _users = [];

  @override
  void initState() {
    _initRepository().then((_) => _loadUsers());
    super.initState();
  }

  Future<void> _initRepository() async {
    _userRepository = UserRepository(db: widget.db);
    await _userRepository.init();
  }

  Future<void> _loadUsers() async {
    final users = await _userRepository.getUsers();
    if (mounted) {
      setState(() => _users = users);
    }
  }

  Future<void> _createNewUser() async {
    await _userRepository.createUser(CreateUserDto(
      name: 'Вадим',
      email: 'vadim@example.com',
      age: 55,
    ));
    await _loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final user = _users[index];
          return ListTile(
            leading: Text(user.id.toString()),
            title: Text(user.name),
            subtitle: Text(user.email),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await _createNewUser();
        },
      ),
    );
  }
}
