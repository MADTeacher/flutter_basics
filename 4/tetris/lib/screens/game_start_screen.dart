import 'package:flutter/material.dart';
import 'package:tetris/main.dart';

/// {@template GameStartScreen}
/// Рутовый экран приложения
/// {@endtemplate}
class GameStartScreen extends StatelessWidget {
  /// {@macro GameStartScreen}
  const GameStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              // Переход на экран игры
              Navigator.pushReplacementNamed(context, GameRouter.gameRoute);
            },
            child: Text(
              'Начать игру',
            )),
      ),
    );
  }
}