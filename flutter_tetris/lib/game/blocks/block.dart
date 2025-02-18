// Базовый класс блока, хранящего в себе игровую фигуру
base class Block {
  int _x; // координаты по x
  int _y; // координаты по y

  // Двумерный массив 4х4, для хранения игровой фигуры
  List<List<int>> _block = List.generate(
    4,
    (_) => List.filled(4, 0),
  );

  // Конструктор
  Block(this._block, [this._x = 4, this._y = 0]);

  int get x => _x;
  int get y => _y;

  // Метод перемещения фигуры
  void move(int x, int y) {
    _x = x;
    _y = y;
  }

  // Метод параметризированного копирования фигуры
  Block copyWith({int? xParam, int? yParam}) {
    List<List<int>> tmp = List.generate(4, (_) => List.filled(4, 0));
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        tmp[i][j] = _block[i][j];
      }
    }
    return Block(tmp, xParam ?? _x, yParam ?? _y);
  }

  // Метод поворота
  void rotate() {
    List<List<int>> tmp = List.generate(4, (_) => List.filled(4, 0));
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        tmp[i][j] = _block[j][3 - i];
      }
    }
    _block = tmp;
  }

  // Оператор индексирования
  List<int> operator [](int index) {
    return _block[index];
  }
}
