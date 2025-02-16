import 'package:calculator/calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Для удобства создадим группу тестов
  group('Тест класса Calculator', () {
    final calculator = Calculator();

    test('Тест сложения', () {
      final result = calculator.add(2, 3);
      expect(result, equals('5'));
    });

    test('Тест вычитания', () {
      final result = calculator.subtract(5, 3);
      expect(result, equals('2'));
    });

    test('Тест умножения', () {
      final result = calculator.multiply(3, 4);
      expect(result, equals('12'));
    });

    test('Тест деления', () {
      final result = calculator.divide(6, 3);
      expect(result, equals('2.0'));
    });

    test('Тест деления на 0', () {
      expect(
        () => calculator.divide(6, 0),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}
