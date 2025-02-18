import 'package:flutter/material.dart';
import 'package:flutter_tetris/game/tetris_game.dart';

/// {@template GameScreen}
/// Экран игры
/// {@endtemplate}
class GameScreen extends StatelessWidget {
  /// {@macro GameScreen}
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TetrisGame();
  }
}
