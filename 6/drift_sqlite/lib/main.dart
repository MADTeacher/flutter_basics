import 'package:drift_sqlite/database.dart';
import 'package:drift_sqlite/users_table.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = AppDatabase();
  await createUser();
  await getUsers();
  await getUserById(1);
  await getFilteredUsers();
  runApp(MyApp(database: database));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.database,
  });

  final AppDatabase database;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(db: database),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.db});

  final AppDatabase db;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Дрифт'),
      floatingActionButton: FloatingActionButton(
        onPressed: createUser,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
