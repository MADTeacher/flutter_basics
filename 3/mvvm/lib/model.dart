// Модель, управляющая данными счетчика
class Model {
  int _counter;

  Model(this._counter);

  // Получение текущего значения счетчика
  int get counter => _counter;

  // Увеличение значения счетчика
  void increment() {
    _counter++;
  }

  // Уменьшение значения счетчика
  void decrement() {
    _counter--;
  }
}