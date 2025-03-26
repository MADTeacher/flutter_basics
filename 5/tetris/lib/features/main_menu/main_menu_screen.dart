import 'package:flutter/material.dart';
import 'package:tetris/main.dart';

/// Главное меню игры
class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
              onPressed: () {
                // Переход на экран ввода имени игрока
                Navigator.pushReplacementNamed(context, GameRouter.userRoute);
              },
              child: Text('Начать игру')),
          SizedBox(height: 16),
          ElevatedButton(
              onPressed: () {
                // Переход на экран ввода имени игрока
                Navigator.pushNamed(context, GameRouter.scoresRoute);
              },
              child: Text('Лучшие результаты')),
        ],
      ),
    ));
  }
}
