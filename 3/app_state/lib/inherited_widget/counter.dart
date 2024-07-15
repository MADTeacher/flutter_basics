// Модель данных для состояния счетчика
class Counter {
  /// Поле для хранения текущего значения счетчика
  int _value = 0;

  /// Геттер для получения текущего значения счетчика
  int get value => _value;

  /// Метод increment, который будет увеличивать значение _value
  void increment() {
    _value++;
  }
  /// Метод decrement, который будет уменьшать значение _value
  void decrement() {
    _value--;
  }
}
