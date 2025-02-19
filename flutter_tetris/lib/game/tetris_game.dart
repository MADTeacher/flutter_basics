import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tetris/game/board.dart';
import 'package:flutter_tetris/game/game.dart';
import 'package:flutter_tetris/main.dart';

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
    game = Game(onGameOver: (scores) {
      // Переход на экран окончания игры
      // Передаем заработанные очки в аргументы маршрута
      Navigator.pushReplacementNamed(
        context,
        AppRouter.gameOverRoute,
        arguments: scores,
      );
    });
    game.start(
      onUpdate: () {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      autofocus: true,
      onKeyEvent: (FocusNode node, KeyEvent event) {
        // Обработка нажатий клавиш
        // Если событие - нажатие клавиши
        if (event is KeyDownEvent) {
          game.board.keyboardEventHandler(_getKeyAction(event));
          setState(() {});
          return KeyEventResult.handled;
        }
        // Если событие не обработано, возвращаем ignored
        return KeyEventResult.ignored;
      },
      child: CustomPaint(
        painter: _GamePainter(game.board.mainBoard),
      ),
    );
  }

  String _getKeyAction(KeyEvent event) {
    int keyCode = event.logicalKey.keyId;
    if (keyCode == 119) {
      return 'rotate';
    } else if (keyCode == 97) {
      return 'left';
    } else if (keyCode == 115) {
      return 'down';
    } else if (keyCode == 100) {
      return 'right';
    } else {
      return '';
    }
  }
}

// Класс отрисовки игрового поля
class _GamePainter extends CustomPainter {
  // Игровое поле
  final List<List<int>> board;

  _GamePainter(this.board);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    double blockSize = size.width / 9;
    // Отрисовка игрового поля
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[i].length; j++) {
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
