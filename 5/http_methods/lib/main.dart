import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _getUser,
              child: const Text('Получить пользователя (GET)'),
            ),
            ElevatedButton(
              onPressed: _createUser,
              child: const Text('Создать пользователя (POST)'),
            ),
            ElevatedButton(
              onPressed: _putUser,
              child: const Text('Обновить пользователя (PUT)'),
            ),
            ElevatedButton(
              onPressed: _patchUser,
              child: const Text('Обновить пользователя (PATH)'),
            ),
            ElevatedButton(
              onPressed: _deleteUser,
              child: const Text('Удалить пользователя (DELETE)'),
            ),
          ],
        ),
      ),
    );
  }

  void _getUser() async {
    final url = Uri.parse('http://localhost:8080/users/1');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final user = User.fromJson(data);
      print(user);
    }
  }

  void _createUser() async {
    final url = Uri.parse('http://localhost:8080/users');
    const user = User(
      id: 6,
      name: 'Игорь',
      surname: 'Валерьевич',
      lastname: 'Ватюнин',
      email: 'vatunin@example.com',
      age: 25,
      height: 180,
      weight: 70,
    );
    final data = jsonEncode(user.toJson());
    final response = await http.post(url, body: data);
    print(response.statusCode);
  }

  void _putUser() async {
    final url = Uri.parse('http://localhost:8080/users/1');
    const user = User(
      id: 1,
      name: 'Игорь',
      surname: 'Валерьевич',
      lastname: 'Ватюнин',
      email: 'vatunin@example.com',
      age: 25,
      height: 180,
      weight: 70,
    );
    final data = jsonEncode(user.toJson());
    final response = await http.put(url, body: data);
    print(response.statusCode);
  }

  void _patchUser() async {
    final url = Uri.parse('http://localhost:8080/users/1');
    final updates = {'name': 'Игорь'};
    final data = jsonEncode(updates);
    final response = await http.patch(url, body: data);
    print(response.statusCode);
  }

  void _deleteUser() async {
    final url = Uri.parse('http://localhost:8080/users/1');
    final response = await http.delete(url);
    print(response.statusCode);
  }
}

class User {
  const User({
    required this.id,
    required this.name,
    required this.surname,
    required this.lastname,
    required this.email,
    required this.age,
    required this.height,
    required this.weight,
  });

  final int id;
  final String name;
  final String surname;
  final String lastname;
  final String email;
  final int age;
  final double height;
  final double weight;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'surname': surname,
      'lastname': lastname,
      'email': email,
      'age': age,
      'height': height,
      'weight': weight,
    };
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      surname: map['surname'] as String,
      lastname: map['lastname'] as String,
      email: map['email'] as String,
      age: map['age'] as int,
      height: map['height'] as double,
      weight: map['weight'] as double,
    );
  }
}
