import 'dart:io';

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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _deleteUser(context),
              child: const Text('Создать пользователя (POST)'),
            ),
          ],
        ),
      ),
    );
  }

  void _deleteUser(BuildContext context) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final url = Uri.parse('http://localhost:8080/users/6');
    final response = await http.delete(url);
    if (response.statusCode == HttpStatus.accepted) {
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('Пользователь удален')),
      );
      return;
    }
    if (response.statusCode == HttpStatus.notFound) {
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('Пользователь не найден')),
      );
      return;
    }
    scaffoldMessenger.showSnackBar(
      const SnackBar(content: Text('Что-то пошло не так')),
    );
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
