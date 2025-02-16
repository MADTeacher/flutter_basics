/// Класс реализующий основные методы калькулятора
class Calculator {
  // Последнее вычисленное значение
  String lastValue = 'Не определено';

  String add(int a, int b) {
    lastValue = (a + b).toString();
    return lastValue;
  }

  String subtract(int a, int b) {
    lastValue = (a - b).toString();
    return lastValue;
  }

  String multiply(int a, int b) {
    lastValue = (a * b).toString();
    return lastValue;
  }

  /// Если b == 0, вернём ошибку.
  String divide(int a, int b) {
    if (b == 0) {
      lastValue = 'Ошибка';
      throw ArgumentError('На ноль делить нельзя');
    }
    lastValue = (a / b).toString();
    return lastValue;
  }
}
