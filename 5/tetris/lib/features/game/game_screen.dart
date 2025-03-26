import 'package:flutter/material.dart';
import 'package:tetris/features/game/tetris_game.dart';

/// Экран игры
class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userName = ModalRoute.of(context)?.settings.arguments.toString() ??
        "Неизвестный игрок";
    return Scaffold(
        body: TetrisGame(
      userName: userName,
    ));
  }
}
