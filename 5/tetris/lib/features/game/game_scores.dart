import 'package:flutter/material.dart';

// Виджет для отображения количества набранных очков
// и кнопки для перезапуска игры после завершения игры
class GameScores extends StatelessWidget {
  // Количество очков
  final int score;
  // Обработчик события перезапуска игры
  final VoidCallback onRestart;
  // Обработчик события перехода в главное меню
  final VoidCallback onMainMenu;
  // Имя пользователя
  final String userName;

  const GameScores({
    super.key,
    required this.score,
    required this.onRestart,
    required this.onMainMenu,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Игрок: $userName\nЗаработанные очки : $score',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: onRestart,
              child: Text('Перезапустить игру'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: onMainMenu,
              child: Text('В главное меню'),
            ),
          ],
        ),
      ),
    );
  }
}
