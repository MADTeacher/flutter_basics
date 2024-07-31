import 'package:flutter/material.dart';
import 'counter.dart';

// CounterProvider - InheritedWidget для управления состоянием счетчика
class CounterProvider extends InheritedWidget {
  // Поле counter для хранения состояния счетчика
  final Counter counter;
  // callback-функции для увеличения и уменьшения счетчика
  final VoidCallback incrementFunction;
  final VoidCallback decrementFunction;

  // Конструктор CounterProvider принимает модель counter и child
  const CounterProvider({
    super.key,
    required this.counter,
    required super.child,
    required this.incrementFunction,
    required this.decrementFunction,
  });

  void increment() {
    incrementFunction();
  }

  void decrement() {
    decrementFunction();
  }

  // Метод updateShouldNotify вызывается, когда необходимо определить,
  // нужно ли обновить виджеты-потомки
  @override
  bool updateShouldNotify(covariant CounterProvider oldWidget) {
    return counter.value != oldWidget.counter.value;
  }

  // Метод of позволяет получить текущий экземпляр CounterProvider из контекста
  static CounterProvider of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<CounterProvider>();
    assert(provider != null, 'CounterProvider не найден');
    return provider!;
  }
}