import 'package:flutter/material.dart';

import 'root_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Пример вложенной навигации (Декларативно)',
      home: RootScreen(),
    );
  }
}
