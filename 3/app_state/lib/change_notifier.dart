import 'package:flutter/material.dart';

/// Создаем класс Counter, который использует миксин ChangeNotifier.
/// Миксин добавляет к классу функциональности для управления подписчиками и уведомлениями.
class Counter with ChangeNotifier {
  /// Определяем приватное поле _count, которое будет хранить текущее значение счетчика.
  int _count = 0;

  /// Определяем публичный геттер для _count. Геттер позволяет другим частям программы
  /// получать текущее значение _count, не изменяя его напрямую.
  int get count => _count;

  /// Метод increment, который будет увеличивать значение _count.
  void increment() {
    _count++;
    // Вызываем метод notifyListeners(), который унаследован от ChangeNotifier.
    // Этот метод уведомляет всех подписчиков о том, что состояние изменилось,
    // и они должны обновить свои данные.
    notifyListeners();
  }
}

void main() {
  runApp(CounterScreen(counter: Counter()));
}

class CounterScreen extends StatelessWidget {
  final Counter counter;

  const CounterScreen({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: AnimatedBuilder(
              animation: counter,
              builder: (context, child) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        '',
                      ),
                      Text(
                        '${counter.count}',
                      )
                    ]);
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
        tooltip: '',
        child: const Icon(Icons.add),
      ),
    );
  }
}