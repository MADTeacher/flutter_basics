// Так как в material.dart входит компонет View,
// скроем его из функционала импортируемой библиотеки
import 'package:flutter/material.dart' hide View;

import 'presenter.dart';
import 'view.dart';
import 'model.dart';

void main() => runApp(
      MaterialApp(
        home: CounterPage(
          presenter: Presenter(model: Model(0)),
        ),
      ),
    );

class CounterPage extends StatefulWidget {
  final Presenter _presenter;

  const CounterPage({super.key, required Presenter presenter})
      : _presenter = presenter;

  @override
  State<CounterPage> createState() => _CounterPageState();
}

// Имплементируем интерфейс View
class _CounterPageState extends State<CounterPage> implements View {
  /// Ссылка на presenter
  late final Presenter _presenter;

  /// Текущее значение счетчика
  late int _counterValue;

  @override
  void initState() {
    super.initState();
    _presenter = widget._presenter;
    /// получаем начальное значение счетчика
    _counterValue = _presenter.countValue;
    /// передаем presenter ссылку на текущий экземпляр View
    _presenter.view = this;
  }

  // Реализуем интерфейс View
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
      body: Center(
          child: Text(
        _counterValue.toString(),
        style: const TextStyle(fontSize: 48),
      )),
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
            onPressed: () => _presenter.decrement(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
