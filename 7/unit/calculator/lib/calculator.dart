/// Класс реализующий основные методы калькулятора
class Calculator {
  String add(int a, int b) => (a + b).toString();

  String subtract(int a, int b) => (a - b).toString();

  String multiply(int a, int b) => (a * b).toString();

  /// Если b == 0, вернём double.nan для упрощения.
  String divide(int a, int b) {
    if (b == 0) {
      throw ArgumentError('На ноль делить нельзя');
    }
    return (a / b).toString();
  }
}
