// Модель, управляющая данными счетчика
class Model {
  int _counter = 0;

  // Получение текущего значения счетчика
  int get counter => _counter;

  // Увеличение значения счетчика
  void increment() {
    _counter++;
  }
}
