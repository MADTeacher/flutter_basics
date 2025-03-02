import 'package:flutter/material.dart';
import 'package:tetris/game_scores.dart';

/// {@template GameOverScreen}
///  Экран окончания игры
/// {@endtemplate}
class GameOverScreen extends StatelessWidget {
  /// {@macro GameOverScreen}
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
            Navigator.pushReplacementNamed(context, '/game');
          }),
    );
  }
}
