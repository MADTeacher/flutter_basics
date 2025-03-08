import 'package:calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Группируем все тесты, относящиеся к
  // CalculatorScreen, в одну группу.
  group('Widget тест для калькулятора', () {
    // Тест проверяет корректность работы операции сложения.
    testWidgets('Проверка сложения', (WidgetTester tester) async {
      // Arrange: Строим CalculatorScreen внутри MaterialApp
      // (для корректного Material-окружения).
      await tester.pumpWidget(MaterialApp(
        home: CalculatorScreen(),
      ));

      // Arrange: Находим первое текстовое поле
      // по тексту "Первое число".
      final firstNumberField = find.widgetWithText(
        TextField,
        'Первое число',
      );
      // Arrange: Находим второе текстовое поле
      // по тексту "Второе число".
      final secondNumberField = find.widgetWithText(
        TextField,
        'Второе число',
      );

      // Act: Вводим  '2' в первое текстовое поле.
      await tester.enterText(firstNumberField, '2');
      // Act: Вводим  '3' во второе текстовое поле.
      await tester.enterText(secondNumberField, '3');
      // Act: Симулируем нажатие на кнопку '+'.
      await tester.tap(find.text('+'));
      // Act: Обновляем дерево виджетов,
      // чтобы отобразить изменения
      // (перерисовка после setState).
      await tester.pump();

      // Assert: Проверяем, что на экране
      // отображается текст
      // с результатом "Результат: 5".
      expect(
        find.text('Результат: 5'),
        findsOneWidget,
      );
    });
  });

  // Тест проверяет корректность работы операции вычитания.
  testWidgets('Проверка вычитания', (WidgetTester tester) async {
    // Arrange: Строим CalculatorScreen внутри MaterialApp.
    await tester.pumpWidget(MaterialApp(home: CalculatorScreen()));

    // Arrange: Находим оба текстовых поля по тексту.
    final firstNumberField = find.widgetWithText(TextField, 'Первое число');
    final secondNumberField = find.widgetWithText(TextField, 'Второе число');

    // Act: Вводим данные
    await tester.enterText(firstNumberField, '5');
    await tester.enterText(secondNumberField, '3');
    // Act: Симулируем нажатие на кнопку с текстом '-' для вычитания.
    await tester.tap(find.text('-'));
    // Act: Перерисовываем виджеты после обновления состояния.
    await tester.pump();

    // Assert: Проверяем, что отображается результат
    expect(find.text('Результат: 2'), findsOneWidget);
  });

  // Тест проверяет корректность работы операции умножения.
  testWidgets('Проверка умножения', (WidgetTester tester) async {
    // Arrange: Строим CalculatorScreen внутри MaterialApp.
    await tester.pumpWidget(MaterialApp(home: CalculatorScreen()));

    // Arrange: Находим оба текстовых поля по тексту.
    final firstNumberField = find.widgetWithText(TextField, 'Первое число');
    final secondNumberField = find.widgetWithText(TextField, 'Второе число');

    // Act: Вводим данные
    await tester.enterText(firstNumberField, '4');
    await tester.enterText(secondNumberField, '3');
    // Act: Симулируем нажатие на кнопку с текстом '*' для умножения.
    await tester.tap(find.text('*'));
    // Act: Обновляем дерево виджетов после setState.
    await tester.pump();

    // Assert: Проверяем, что отображается текст "Результат: 12"
    expect(find.text('Результат: 12'), findsOneWidget);
  });

  // Тест проверяет корректность работы операции деления.
  testWidgets('Проверка деления', (WidgetTester tester) async {
    // Arrange: Строим CalculatorScreen внутри MaterialApp.
    await tester.pumpWidget(MaterialApp(home: CalculatorScreen()));

    // Arrange: Находим оба текстовых поля по тексту.
    final firstNumberField = find.widgetWithText(TextField, 'Первое число');
    final secondNumberField = find.widgetWithText(TextField, 'Второе число');

    // Act: Вводим данные
    await tester.enterText(firstNumberField, '8');
    await tester.enterText(secondNumberField, '2');
    // Act: Симулируем нажатие на кнопку с текстом '/' для деления.
    await tester.tap(find.text('/'));
    // Act: Перерисовываем дерево виджетов после обновления состояния.
    await tester.pump();

    // Assert: Проверяем, что результат деления отображается
    expect(find.text('Результат: 4.0'), findsOneWidget);
  });

  // Тест проверяет сценарий деления на ноль, которое должно приводить к выбросу исключения.
  testWidgets('Division by zero throws an error', (WidgetTester tester) async {
    // Arrange: Строим CalculatorScreen внутри MaterialApp.
    await tester.pumpWidget(MaterialApp(home: CalculatorScreen()));

    // Arrange: Находим оба текстовых поля по тексту.
    final firstNumberField = find.widgetWithText(TextField, 'Первое число');
    final secondNumberField = find.widgetWithText(TextField, 'Второе число');

    // Act: Вводим данные
    await tester.enterText(firstNumberField, '10');
    // Act: Вводим '0' во второе текстовое поле для имитации деления на ноль.
    await tester.enterText(secondNumberField, '0');
    // Act: Симулируем нажатие на кнопку с текстом '/'.
    await tester.tap(find.text('/'));
    // Act: Перерисовываем дерево виджетов после обновления состояния.
    await tester.pump();

    // Assert: Функция деления при b == 0 выбрасывает ArgumentError.
    // Метод takeException захватывает выброшенное исключение.
    final exception = tester.takeException();
    // Assert: Проверяем, что исключение является экземпляром ArgumentError.
    expect(exception, isInstanceOf<ArgumentError>());
  });

  // Тест проверяет, что если ввод оставить пустым, то значение по умолчанию считается равным 0.
  testWidgets('Проверка на деление на 0', (WidgetTester tester) async {
    // Arrange: Строим CalculatorScreen внутри MaterialApp.
    await tester.pumpWidget(MaterialApp(home: CalculatorScreen()));

    // Arrange: Находим оба текстовых поля по тексту.
    final firstNumberField = find.widgetWithText(TextField, 'Первое число');
    final secondNumberField = find.widgetWithText(TextField, 'Второе число');

    // Act: Оставляем первое текстовое поле пустым (будет интерпретировано как 0).
    await tester.enterText(firstNumberField, '');
    // Act: Вводим '5' во второе текстовое поле.
    await tester.enterText(secondNumberField, '5');
    // Act: Симулируем нажатие на кнопку с текстом '+' для сложения.
    await tester.tap(find.text('+'));
    // Act: Перерисовываем виджеты после обновления состояния.
    await tester.pump();

    // Assert: Проверяем, что результат отображается как "Результат: 5" (0 + 5 = 5).
    expect(find.text('Результат: 5'), findsOneWidget);
  });
}
