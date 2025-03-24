import 'package:flutter/material.dart';
import 'package:tetris/game_scores.dart';
import 'package:tetris/main.dart';

///  Экран окончания игры
class GameOverScreen extends StatelessWidget {
  const GameOverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Получаем заработанные очки, переданные в маршрут
    final args = ModalRoute.of(context)?.settings.arguments;
    // Безопасно получаем имя игрока, переданное в маршрут
    final userName = (args != null &&
            args is Map<String, dynamic> &&
            args['userName'] != null)
        ? args['userName'].toString()
        : 'Неизвестный игрок';

    // Безопасно получаем количество очков, переданных в маршрут
    final scores = (args != null && args is Map<String, dynamic>)
        ? int.tryParse(args['scores'].toString()) ?? 0
        : 0;

    return Scaffold(
        body: GameScores(
      score: scores,
      onRestart: () {
        // Переход на экран игры
        Navigator.pushReplacementNamed(
          context,
          GameRouter.gameRoute,
          arguments: userName,
        );
      },
      onMainMenu: () {
        // Переход на главное меню
        Navigator.pushReplacementNamed(
          context,
          GameRouter.initialRoute,
        );
      },
      userName: userName,
    ));
  }
}
