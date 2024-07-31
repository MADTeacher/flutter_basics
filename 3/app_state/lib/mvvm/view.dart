import 'package:app_state/mvvm/view_model.dart';
import 'package:flutter/material.dart';

class CounterView extends StatelessWidget {
  // У данной View, есть привязка к ViewModel,
  // но нет доступа к Model
  final ViewModel viewModel;

  const CounterView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Используем AnimatedBuilder для отслеживания изменений
        child: AnimatedBuilder(
          animation: viewModel,
          builder: (context, _) {
            return Text('Счетчик: ${viewModel.counter}');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Обращаемся к ViewModel и отправляем событие увеличения счетчика
        onPressed: viewModel.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
