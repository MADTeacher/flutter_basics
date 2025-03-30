import 'package:flutter/material.dart';
import 'package:tetris/features/game/game_scores.dart';
import 'package:tetris/main.dart';

///  Экран окончания игры
class GameOverScreen extends StatelessWidget {
  const GameOverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Получаем заработанные очки, переданные в маршрут
    final args = ModalRoute.of(context)?.settings.arguments;
    final scores = int.tryParse(args.toString()) ?? 0;

    return Scaffold(
        body: GameScores(
            score: scores,
            onRestart: () {
              // Переход на экран игры
              Navigator.pushReplacementNamed(
                context,
                GameRouter.gameRoute,
              );
            }));
  }
}
