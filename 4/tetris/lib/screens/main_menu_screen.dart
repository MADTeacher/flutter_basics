import 'package:flutter/material.dart';
import 'package:tetris/main.dart';

/// Главное меню игры
class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
          onPressed: () {
            // Переход на экран игры
            Navigator.pushReplacementNamed(context, GameRouter.gameRoute);
          },
          child: Text('Начать игру')),
    ));
  }
}
