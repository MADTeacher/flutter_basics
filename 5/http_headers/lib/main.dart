import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  String? _helloStr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _fetchUsersList,
              child: const Text('Привет!'),
            ),
            const SizedBox(height: 8),
            Text(_helloStr != null ? _helloStr! : '...')
          ],
        ),
      ),
    );
  }

  void _fetchUsersList() async {
    final url = Uri.parse('http://localhost:8080/hello');
    final response = await http.get(
      url,
      headers: {HttpHeaders.acceptLanguageHeader: 'ru'},
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as String;
      setState(() => _helloStr = data);
      return;
    }
  }
}
