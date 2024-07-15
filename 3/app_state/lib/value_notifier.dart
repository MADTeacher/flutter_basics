import 'package:flutter/material.dart';

class _Counter {
  // Создаем ValueNotifier для хранения значения счетчика
  final ValueNotifier<int> _count = ValueNotifier<int>(0);

  // Геттер для получения текущего значения счетчика
  ValueNotifier<int> get count => _count;

  // Метод для увеличения значения счетчика
  void increment() {
    _count.value++; // Увеличиваем значение счетчика на 1
  }
}

void main() {
  runApp(MaterialApp(home: CounterScreen()));
}

class CounterScreen extends StatelessWidget {
   // Создаем экземпляр модели состояния
  final counter = _Counter();

  CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          // Используем ValueListenableBuilder для автоматического обновления
          child: ValueListenableBuilder<int>(
              // Слушаем значение счетчика
              valueListenable: counter.count,
              // Отображаем текущее значение счетчика
              builder: (context, count, child) => Text('$count'))),
      floatingActionButton: FloatingActionButton(
        
          // Увеличиваем счетчик при нажатии
          onPressed: counter.increment, child: const Icon(Icons.add)),
    );
  }
}
