import 'dart:async';

import 'package:flutter/material.dart';

import 'blocks/blocks.dart';
import 'board.dart';

// Класс игры
final class Game {
  late Board board; // игровое поле
  late Block currentBlock; // текущий блок
  late Block nextBlock; // следующий блок
  bool _isGameOver = false; // флаг окончания игры
  int score = 0; // счет

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
  }

  // Метод обновления счета
  void updateScore() {
    score += 10;
  }

  // Метод генерации новой фигуры
  Block newBlock() {
    currentBlock = nextBlock;
    nextBlock = getNewRandomBlock();
    return currentBlock;
  }

  // Метод запуска игры
  Future<void> start({required VoidCallback onUpdate}) async {
    // Запускаем игровой цикл
    while (!_isGameOver) {
      nextStep();
      await Future.delayed(const Duration(milliseconds: 500));
      onUpdate();
    } 
    onGameOver(score.toString());
  }

  void gameOver() {
    _isGameOver = true;
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
    }
  }
}
