import 'package:app_state/bloc/bloc.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: _CounterScreen()));

class _CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<_CounterScreen> {
  final CounterBloc _bloc = CounterBloc();
  @override
  void dispose() {
    // При удалении виджета освобождаем ресурсы
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // В этом примере используем StreamBuilder для отслеживания изменений
        child: StreamBuilder<BlocState>(
          // Слушаем поток событий счетчика
          stream: _bloc.stream,
          // Начальное состояние счетчика
          initialData: _bloc.state,
          builder: (_, __) {
            // Отображаем текущее значение счетчика
            // при изменении состояния
            return Text('${_bloc.state.count}');
          },
        ),
      ),
      floatingActionButton: Column(
         mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            // Отправляем событие увеличения счетчика
            onPressed: () => _bloc.add(BlocEvent.increment),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            // Отправляем событие уменьшения счетчика
            onPressed: () => _bloc.add(BlocEvent.decrement),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
