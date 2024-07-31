import 'package:flutter/material.dart';
import 'view_model.dart';

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
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, _) {
            return Text(
              '${viewModel.counter}',
              style: const TextStyle(fontSize: 48),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            // Отправляем событие увеличения счетчика
            onPressed: viewModel.increment,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            // Отправляем событие уменьшения счетчика
            onPressed: viewModel.decrement,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
