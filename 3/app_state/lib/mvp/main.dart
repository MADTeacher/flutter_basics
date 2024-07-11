import 'package:app_state/mvp/presenter.dart';
import 'package:app_state/mvp/view.dart';
import 'package:flutter/material.dart' hide View;

void main() => runApp(const MaterialApp(home: CounterPage()));

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> implements View {
  /// Создаем объект presenter
  late Presenter _presenter;

  @override
  void initState() {
    super.initState();
    /// Инициализируем presenter, 
    /// передаем ему ссылку на текущий экземпляр view
    _presenter = Presenter(this);
  }

  /// Текущее значение счетчика
  int _counterValue = 0;

  @override
  void updateCounter(int value) {
    // Обновляем значение счетчика виджета
    // при получении события из View 
    setState(() {
      _counterValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(_counterValue.toString())),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            // Отправляем событие увеличения счетчика
            onPressed: () => _presenter.increment(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            // Отправляем событие уменьшения счетчика
            onPressed: () => _presenter.increment(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
