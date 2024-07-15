import 'package:app_state/inherited_widget/counter.dart';
import 'package:flutter/material.dart';
import 'counter_provider.dart';

void main() => runApp(CounterProvider(
      counter: Counter(),
      child: const MaterialApp(home: _CounterScreen()),
    ));

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
            onPressed: () {
              setState(() {
                // Увеличение значения счетчика
                provider.counter.increment();
              });
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              // Уменьшение значения счетчика
              setState(() {
                provider.counter.decrement();
              });
            },
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
    return Center(
      child: Text(
        // Выводим текущее значение счетчика
        '${CounterProvider.of(context).counter.value}',
        style: const TextStyle(fontSize: 48),
      ),
    );
  }
}
