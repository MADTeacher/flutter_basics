// Модель данных для состояния счетчика
class Counter {
  Counter([int value = 0]) : _value = value;

  /// Поле для хранения текущего значения счетчика
  int _value = 0;

  /// Геттер для получения текущего значения счетчика
  int get value => _value;

  /// Метод increment для увеличения значения _value
  void increment() {
    _value++;
  }

  /// Метод decrement для уменьшения значения _value
  void decrement() {
    _value--;
  }

  /// Метод copyWith возвращает новый экземпляр Counter
  Counter copyWith({int? value}) {
    return Counter(
      _value = value ?? _value,
    );
  }
}
