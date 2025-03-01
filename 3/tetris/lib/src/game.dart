import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'blocks/blocks.dart';
import 'board.dart';

/// Наследуем класс от ChangeNotifier для возможности уведомления об изменениях
/// внутри класса
final class Game extends ChangeNotifier {
  late Board board; // Сделаем открытым
  late Block currentBlock;
  late Block nextBlock;
  bool _isGameOver = false;
  int score = 0;

  // Обратный вызов при окончании игры
  final Function(String scores) onGameOver;

  Game({required this.onGameOver}) {
    currentBlock = getNewRandomBlock();
    nextBlock = getNewRandomBlock();

    board = Board(
      currentBlock: currentBlock,
      newBlockFunc: newBlock,
      updateScore: updateScore,
      updateBlock: updateBlock,
      gameOver: gameOver,
    );
  }

  // Метод обновления блока фигуры
  void updateBlock(Block block) {
    currentBlock = block;
    // Уведомляем слушателей об изменениях в блоке
    // Когда пользователь нажимает на кнопку
    notifyListeners();
  }

  // Метод обновления счета
  void updateScore() {
    score += 10;
    // Уведомляем слушателей об изменениях в счете
    // Для возможности обновления счета на экране
    notifyListeners();
  }

  // Метод генерации новой фигуры
  Block newBlock() {
    currentBlock = nextBlock;
    nextBlock = getNewRandomBlock();
    return currentBlock;
  }

  // Метод запуска игры
  Future<void> start() async {
    // Запускаем игровой цикл
    while (!_isGameOver) {
      nextStep();
      await Future.delayed(const Duration(milliseconds: 500));
    }
    onGameOver(score.toString());
  }

  // Метод вывода текущего счета в игре
  void printScore() {}

  bool get isGameOver => _isGameOver;

  void gameOver() {
    _isGameOver = true;
    // Уведомляем слушателей об окончании игры
    notifyListeners();
  }

  // Метод обработки шага игрового цикла
  void nextStep() {
    var x = currentBlock.x;
    var y = currentBlock.y;

    if (!board.isFilledBlock(x, y + 1)) {
      board.moveBlock(x, y + 1);
    } else {
      board.clearLine();
      board.savePresentBoardToCpy();
      board.newBlock();
      board.drawBoard();
    }
    // Уведомляем слушателей после каждого шага
    notifyListeners();
  }
}
