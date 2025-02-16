import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:async_example/main.dart';

void main() {
  testWidgets('Нажатие кнопки запускает загрузку данных', (tester) async {
    await tester.pumpWidget(Example());

    // Нажимаем на кнопку
    await tester.tap(find.text('Загрузить данные'));

    // Перерисовываем UI после изменения состояния
    await tester.pump();

    // Проверяем, что отображается индикатор загрузки
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Ждём завершения загрузки (две секунды в будущем)
    await tester.pump(Duration(seconds: 2));

    // Проверяем, что после загрузки отображается текст "Данные загружены"
    expect(find.text('Данные загружены'), findsOneWidget);
  });
}
