import 'package:flutter/material.dart';

/// {@template RootScreen}
/// Рутовый экран приложения
/// {@endtemplate}
class RootScreen extends StatelessWidget {
  /// {@macro RootScreen}
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              // Переход на экран игры
              Navigator.pushReplacementNamed(context, '/game');
            },
            child: Text(
              'Начать игру',
            )),
      ),
    );
  }
}
