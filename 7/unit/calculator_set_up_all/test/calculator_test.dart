import 'package:calculator/calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Для удобства создадим группу тестов
  group('Тест класса Calculator', () {
    // Остальной код тестов
    final Calculator calculator = Calculator();

    setUpAll(() async {
      await calculator.init();
    });

    test('Тест сложения', () {
      final result = calculator.add(2, 3);
      expect(result, equals('5'));
      print('Elapsed time: ${calculator.timer.elapsedMilliseconds} ms');
    });
    // Остальной код тестов

    test('Тест вычитания', () {
      final result = calculator.subtract(5, 3);
      expect(result, equals('2'));
      print('Elapsed time: ${calculator.timer.elapsedMilliseconds} ms');
    });

    test('Тест умножения', () {
      final result = calculator.multiply(3, 4);
      expect(result, equals('12'));
      print('Elapsed time: ${calculator.timer.elapsedMilliseconds} ms');
    });

    test('Тест деления', () {
      final result = calculator.divide(6, 3);
      expect(result, equals('2.0'));
      print('Elapsed time: ${calculator.timer.elapsedMilliseconds} ms');
    });

    test('Тест деления на 0', () {
      expect(
        () => calculator.divide(6, 0),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}
