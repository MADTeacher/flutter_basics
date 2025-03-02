import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tetris/game_scores.dart';
import 'package:tetris/src/board.dart';
import 'package:tetris/src/game.dart';

/// Имплементация игры Тетрис
class TetrisGame extends StatefulWidget {
  const TetrisGame({super.key});

  @override
  State<TetrisGame> createState() => _TetrisGameState();
}

class _TetrisGameState extends State<TetrisGame> {
  late Game game;

  @override
  void initState() {
    super.initState();
    game = Game(() {
     
    },);
    game.start();
  }

  @override
  Widget build(BuildContext context) {
    // Добавляем слушателя для обновления состояния виджета
    return ListenableBuilder(
      // Передаем игру в качестве объекта, реализующего Listenable
      listenable: game,
      // Перестраиваем виджет при изменении состояния игры
      builder: (context, _) {
        if (game.isGameOver) {
          return Center(
            child: GameScores(
              score: game.score,
              onRestart: () {
                // Перезапускаем игру
                game.restart();
              },
            ),
          );
        }
        return Focus(
          autofocus: true,
          onKeyEvent: (FocusNode node, KeyEvent event) {
            // Обработка нажатий клавиш
            // Обрабатываем как нажатие, так и удержание клавиши
            if (event is KeyDownEvent || event is KeyRepeatEvent) {
              game.board.keyboardEventHandler(event.logicalKey.keyId);
              return KeyEventResult.handled;
            }
            // Если событие не обработано, возвращаем ignored
            return KeyEventResult.ignored;
          },
          child: Align(
            alignment: Alignment.center,
            // Получаем размеры виджета
            child: LayoutBuilder(
              builder: (context, constraints) {
                final board = game.board.mainBoard;
                // Вычисляем размер клетки поля
                double blockSize = min(constraints.maxWidth / board[0].length,
                    constraints.maxHeight / board.length);
                return CustomPaint(
                  painter: _GamePainter(board, blockSize),
                  size: Size(
                      board[0].length * blockSize, board.length * blockSize),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

// Класс отрисовки игрового поля
class _GamePainter extends CustomPainter {
  // Игровое поле
  final List<List<int>> board;
  final double blockSize;

  _GamePainter(this.board, this.blockSize);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    for (int i = 0; i < board.length - 1; i++) {
      for (int j = 0; j < board[i].length - 1; j++) {
        Rect rect =
            Rect.fromLTWH(j * blockSize, i * blockSize, blockSize, blockSize);
        switch (board[i][j]) {
          // Отрисовка пустых клеток поля
          case Board.posFree:
            paint.color = Colors.black;
          // Отрисовка блоков и заполненных клеток поля
          case Board.posFilled:
            paint.color = Colors.white;
          // Отрисовка границ поля
          case Board.posBoarder:
            paint.color = Colors.red;
        }
        canvas.drawRect(rect, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
