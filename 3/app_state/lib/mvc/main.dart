import 'package:app_state/mvc/controller.dart';
import 'package:app_state/mvc/model.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: CounterPage()));

// Виджет, отображающий интерфейс счетчика
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

// Состояние виджета CounterPage, реализующее обновление UI
class _CounterPageState extends State<CounterPage> {
  late final Controller _controller;
  late final Model _model;

  @override
  void initState() {
    super.initState();
    // Инициализация модели и контроллера
    _model = Model();
    _controller = Controller(_model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(_controller.counter.toString())),
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
