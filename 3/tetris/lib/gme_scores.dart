import 'package:flutter/material.dart';

/// Виджет для отображения количества набранных очков
/// и кнопки для перезапуска игры после завершения игры
class GameScores extends StatelessWidget {
  final int score;
  final VoidCallback onRestart;

  const GameScores({
    super.key,
    required this.score,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Заработанные очки: $score',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: onRestart,
          child: Text('Перезапустить игру'),
        ),
      ],
    );
  }
}
