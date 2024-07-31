// Модель, управляющая данными счетчика
class Model {
  int _counter = 0;

  // Геттер для получения текущего значения счетчика
  int get counter => _counter;

  // Метод для увеличения значения счетчика
  void increment() {
    _counter++;
  }

  // Метод для уменьшения значения счетчика
  void decrement() {
    _counter--;
  }
}