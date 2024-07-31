import 'package:flutter/material.dart';
import 'counter.dart';
import 'counter_provider.dart';
import 'counter_di.dart';

void main() => runApp(
      CounterEmbedder(
        counter: Counter(5),
        child: const MaterialApp(
          home: _CounterScreen(),
        ),
      ),
    );

/// Пример использования InheritedWidget
class _CounterScreen extends StatefulWidget {
  const _CounterScreen();

  @override
  State<_CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<_CounterScreen> {
  @override
  Widget build(BuildContext context) {
    // Используем InheritedWidget для доступа к счетчику
    final provider = CounterProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Пример InheritedWidget'),
      ),
      body: const _CounterView(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            // Кнопка увеличения счетчика
            onPressed: provider.increment,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            // Кнопка уменьшения счетчика
            onPressed: provider.decrement,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

/// Виджет, отображающий текущее значение счетчика
class _CounterView extends StatelessWidget {
  const _CounterView();

  @override
  Widget build(BuildContext context) {
    final counter = CounterProvider.of(context).counter;
    return Center(
      child: Text(
        // Выводим текущее значение счетчика
        '${counter.value}',
        style: const TextStyle(fontSize: 48),
      ),
    );
  }
}
