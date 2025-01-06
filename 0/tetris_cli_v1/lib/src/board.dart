import 'blocks/blocks.dart';
import 'ansi_cli_helper/ansi_cli_helper.dart';

class Board {
  static const int heightBoard = 20;
  static const int widthBoard = 10;
  static const int posFree = 0;
  static const int posFilled = 1;
  static const int posBoarder = 2;

  late List<List<int>> mainBoard;
  late List<List<int>> mainCpy;
  // callback-функция для создания нового блока
  Block Function() newBlockFunc;
  // callback-функция для обновления счета
  void Function() updateScore;
  // callback-функция для обновления блока
  void Function(Block block) updateBlock;
  // callback-функция завершения игры
  void Function() gameOver;
  Block currentBlock; // текущий блок с игровой фигурой
  AnsiCliHelper ansiCliHelper;

  Board({
    required this.newBlockFunc,
    required this.currentBlock,
    required this.updateScore,
    required this.updateBlock,
    required this.ansiCliHelper,
    required this.gameOver,
  }) {
    mainBoard = List.generate(
      heightBoard,
      (_) => List.filled(widthBoard, 0),
    );
    mainCpy = List.generate(
      heightBoard,
      (_) => List.filled(widthBoard, 0),
    );
    initDrawMain();
  }

  // обработка нажатия клавиш по их ASCII-коду
  void keyboardEventHandler(int key) {
    var x = currentBlock.x;
    var y = currentBlock.y;

    switch (key) {
      case 119: // W – поворот фигуры
        rotateBlock();
      case 97: // A - влево
        if (!isFilledBlock(x - 1, y)) {
          moveBlock(x - 1, y);
        }
      case 115: // S - вниз
        if (!isFilledBlock(x, y + 1)) {
          moveBlock(x, y + 1);
        }
      case 100: // D - вправо
        if (!isFilledBlock(x + 1, y)) {
          moveBlock(x + 1, y);
        }
    }
  }

  // сохранение текущего состояния игрового поля
  void savePresentBoardToCpy() {
    for (int i = 0; i < heightBoard - 1; i++) {
      for (int j = 0; j < widthBoard - 1; j++) {
        mainCpy[i][j] = mainBoard[i][j];
      }
    }
  }

  // Метод инициализации игровой доски
  void initDrawMain() {
    for (int i = 0; i <= heightBoard - 2; i++) {
      for (int j = 0; j <= widthBoard - 2; j++) {
        if (j == 0 || j == widthBoard - 2 || i == heightBoard - 2) {
          mainBoard[i][j] = posBoarder;
          mainCpy[i][j] = posBoarder;
        }
      }
    }

    newBlock();
    drawBoard();
  }

  // Метод отрисовки основной доски
  void drawBoard() {
    ansiCliHelper.gotoxy(0, 0);
    for (int i = 0; i < heightBoard - 2; i++) {
      for (int j = 0; j < widthBoard - 1; j++) {
        switch (mainBoard[i][j]) {
          case posFree:
            ansiCliHelper.write('⬛');
          case posFilled:
            ansiCliHelper.write('⬜');
          case posBoarder:
            ansiCliHelper.write('🟥');
        }
      }
      ansiCliHelper.write('\n');
    }
    ansiCliHelper.write('🟥');
    ansiCliHelper.write('${'🟥' * 8}\n');
  }

  // Метод генерации нового блока и добавления его на основную доску
  void newBlock() {
    currentBlock = newBlockFunc();
    var x = currentBlock.x;

    // добавляем новый блок на основную доску
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        mainBoard[i][x + j] = mainCpy[i][x + j] + currentBlock[i][j];

        // проверка на пересечение
        if (mainBoard[i][x + j] > 1) {
          gameOver(); // игра окончена
        }
      }
    }
  }

  // Метод перемещения фигуры по основной доске
  void moveBlock(int x2, int y2) {
    // убираем фигуру с текущей позиции
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        if (currentBlock.x + j >= 0) {
          mainBoard[currentBlock.y + i][currentBlock.x + j] -=
              currentBlock[i][j];
        }
      }
    }

    // устанавливаем новую позицию
    currentBlock.move(x2, y2);

    // добавляем фигуру на новую позицию
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        // проверка на левый край
        if (currentBlock.x + j >= 0) {
          mainBoard[currentBlock.y + i][currentBlock.x + j] +=
              currentBlock[i][j];
        }
      }
    }

    drawBoard();
  }

  // Метод обработки поворота блока
  void rotateBlock() {
    // Временный блок с текущей фигурой
    var tmpBlock = currentBlock.copyWith();
    currentBlock.rotate(); // Поворачиваем фигуру

    // Проверка на то, что фигура не пересекается с границей
    // или другими блоками ранее помещенных на доску фигур
    if (isFilledBlock(tmpBlock.x, tmpBlock.y)) {
      currentBlock = tmpBlock;
      // обновляем текущую фигуру в классе Game
      updateBlock(currentBlock); 
    }

    var x = currentBlock.x;
    var y = currentBlock.y;

    // Обновляем основную доску
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        // убираем старую фигуру
        mainBoard[y + i][x + j] -= tmpBlock[i][j];
        
        // добавляем новую фигуру
        mainBoard[y + i][x + j] += currentBlock[i][j];
      }
    }

    drawBoard();
  }

  // Метод очистки заполненных строк
  void clearLine() {
    for (int j = 0; j <= heightBoard - 3; j++) {
      // проверка заполненности строки
      int i = 1;
      while (i <= widthBoard - 3) {
        if (mainBoard[j][i] == posFree) {
          break;
        }
        i++;
      }

      if (i == widthBoard - 2) {
        // если строка заполнена
      // очистка строки и сдвиг строк игровой доски вниз
        for (int k = j; k > 0; k--) {
          for (int idx = 1; idx <= widthBoard - 3; idx++) {
            mainBoard[k][idx] = mainBoard[k - 1][idx];
          }
        }
        // вызываем callBack-функцию для увеличение очков
        updateScore(); 
      }
    }
  }

  // Метод проверки возможности сдвига блока в заданном направлении
  bool isFilledBlock(int x2, int y2) {
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        if (currentBlock[i][j] != 0 && mainCpy[y2 + i][x2 + j] != 0) {
          return true;
        }
      }
    }
    return false;
  }
}
