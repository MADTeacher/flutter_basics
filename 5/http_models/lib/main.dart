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
  User? _user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _fetchUsersList,
              child: const Text('Получить пользователя'),
            ),
            const SizedBox(height: 8),
            Text(
              _user != null ? '${_user!.name} ${_user!.surname}' : 'Данных нет',
            )
          ],
        ),
      ),
    );
  }

  void _fetchUsersList() async {
    final url = Uri.parse('http://localhost:8080/users/1');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final user = User.fromJson(data);
      setState(() => _user = user);
      return;
    }
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
