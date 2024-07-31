import 'package:flutter/material.dart';

/// Создаем класс Counter, который использует миксин ChangeNotifier.
/// Миксин добавляет к классу функциональности
/// для управления подписчиками и уведомлениями.
class Counter with ChangeNotifier {
  /// Определяем приватное поле _count, которое будет
  /// хранить текущее значение счетчика.
  int _count = 0;

  /// Определяем публичный геттер для _count,
  /// который позволяет другим частям программы
  /// получать текущее значение _count, не изменяя его напрямую.
  int get count => _count;

  /// Метод для увеличения значение _count.
  void increment() {
    _count++;
    // Вызываем метод notifyListeners(), наследуемый от ChangeNotifier.
    // Он уведомляет всех подписчиков о том, что состояние изменилось
    // и они должны обновить свои данные.
    notifyListeners();
  }
}

void main() {
  runApp(MaterialApp(home: CounterScreen(counter: Counter())));
}

class CounterScreen extends StatelessWidget {
  final Counter counter;
  const CounterScreen({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: counter,
          builder: (context, child) => Text('${counter.count}'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
