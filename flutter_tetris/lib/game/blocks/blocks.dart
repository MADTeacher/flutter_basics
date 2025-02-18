import 'dart:math';

import 'block.dart';
export 'block.dart';

// Функция для получения нового случайного блока
Block getNewRandomBlock() {
  return _defBlocks[Random().nextInt(_defBlocks.length)].copyWith();
}

final _defBlocks = [
  OBlock(),
  IBlock(),
  IBlock()..rotate(),
  LBlock(),
  LBlock()..rotate(),
  JBlock(),
  JBlock()..rotate(),
  TBlock(),
  TBlock()..rotate(),
  TBlock()
    ..rotate()
    ..rotate(),
  TBlock()
    ..rotate()
    ..rotate()
    ..rotate(),
  SBlock(),
  SBlock()..rotate(),
  SBlock()
    ..rotate()
    ..rotate(),
  SBlock()
    ..rotate()
    ..rotate()
    ..rotate(),
  ZBlock(),
  ZBlock()..rotate(),
  ZBlock()
    ..rotate()
    ..rotate(),
  ZBlock()
    ..rotate()
    ..rotate()
    ..rotate(),
];

final class IBlock extends Block {
  IBlock()
      : super([
          [0, 0, 0, 0],
          [1, 1, 1, 1],
          [0, 0, 0, 0],
          [0, 0, 0, 0],
        ]);
}

final class OBlock extends Block {
  OBlock()
      : super([
          [0, 0, 0, 0],
          [0, 1, 1, 0],
          [0, 1, 1, 0],
          [0, 0, 0, 0],
        ]);
}

final class TBlock extends Block {
  TBlock()
      : super([
          [0, 0, 0, 0],
          [1, 1, 1, 0],
          [0, 1, 0, 0],
          [0, 0, 0, 0],
        ]);
}

final class LBlock extends Block {
  LBlock()
      : super([
          [0, 0, 0, 0],
          [1, 1, 1, 0],
          [1, 0, 0, 0],
          [0, 0, 0, 0],
        ]);
}

final class JBlock extends Block {
  JBlock()
      : super([
          [0, 0, 0, 0],
          [1, 1, 1, 0],
          [0, 0, 1, 0],
          [0, 0, 0, 0],
        ]);
}

final class SBlock extends Block {
  SBlock()
      : super([
          [0, 0, 0, 0],
          [0, 1, 1, 0],
          [1, 1, 0, 0],
          [0, 0, 0, 0],
        ]);
}

final class ZBlock extends Block {
  ZBlock()
      : super([
          [0, 0, 0, 0],
          [1, 1, 0, 0],
          [0, 1, 1, 0],
          [0, 0, 0, 0],
        ]);
}
