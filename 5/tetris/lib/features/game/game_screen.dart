import 'package:flutter/material.dart';
import 'package:tetris/features/game/tetris_game.dart';

/// Экран игры
class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: TetrisGame());
  }
}
