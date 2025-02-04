import 'package:calculator/calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Для удобства создадим группу тестов
  group('Тест класса Calculator', () {
    final calculator = Calculator();

    // setUp(() {
    //   // Перед каждым тестом обнулим последнее значение
    //   calculator.lastValue = 'Не определено';
    // });

    tearDown(() {
      // После каждого теста обнулим последнее значение
      calculator.lastValue = 'Не определено';
    });

    test('Тест сложения', () {
      print('Last value: ${calculator.lastValue}');
      final result = calculator.add(2, 3);
      expect(result, equals('5'));
      // Проверим, что последнее вычисленное значение равно 5
      expect(calculator.lastValue, equals('5'));
      print('Last value: ${calculator.lastValue}');
    });

    test('Тест вычитания', () {
      print('Last value: ${calculator.lastValue}');
      final result = calculator.subtract(5, 3);
      expect(result, equals('2'));
      // Проверим, что последнее вычисленное значение равно 2
      expect(calculator.lastValue, equals('2'));
      print('Last value: ${calculator.lastValue}');
    });

    test('Тест умножения', () {
      print('Last value: ${calculator.lastValue}');
      final result = calculator.multiply(3, 4);
      expect(result, equals('12'));
      expect(calculator.lastValue, equals('12'));
      print('Last value: ${calculator.lastValue}');
    });

    test('Тест деления', () {
      print('Last value: ${calculator.lastValue}');
      final result = calculator.divide(6, 3);
      expect(result, equals('2.0'));
      expect(calculator.lastValue, equals('2.0'));
      print('Last value: ${calculator.lastValue}');
    });

    test('Тест деления на 0', () {
      print('Last value: ${calculator.lastValue}');
      expect(
        () => calculator.divide(6, 0),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}
