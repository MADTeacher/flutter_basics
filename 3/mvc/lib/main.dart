import 'package:flutter/material.dart';
import 'controller.dart';
import 'model.dart';

void main() => runApp(
      MaterialApp(
        home: CounterPage(
          controller: Controller(Model()),
        ),
      ),
    );

// Виджет, отображающий интерфейс счетчика
class CounterPage extends StatefulWidget {
  final Controller _controller;
  const CounterPage({super.key, required Controller controller})
      : _controller = controller;

  @override
  State<CounterPage> createState() => _CounterPageState();
}

// Состояние виджета CounterPage, реализующее обновление UI
class _CounterPageState extends State<CounterPage> {
  late final Controller _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget._controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          _controller.counter.toString(),
          style: const TextStyle(fontSize: 48),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            // Отправляем событие увеличения счетчика
            onPressed: () {
              setState(() {
                _controller.increment();
              });
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            // Отправляем событие уменьшения счетчика
            onPressed: () {
              setState(() {
                _controller.decrement();
              });
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
