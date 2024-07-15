import 'package:app_state/inherited_widget/counter.dart';
import 'package:flutter/material.dart';

// CounterProvider - InheritedWidget для управления состоянием счетчика
class CounterProvider extends InheritedWidget {
  // Поле counter для хранения состояния счетчика
  final Counter counter;

  // Конструктор CounterProvider принимает модель counter и child
  const CounterProvider({
    super.key,
    required this.counter,
    required super.child,
  });

  // Метод updateShouldNotify вызывается, когда необходимо определить,
  // нужно ли обновить виджеты-потомки
  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    // Сравниваем текущее значение counter с предыдущим
    // Возвращаем true, если значения не равны, что сигнализирует
    // о необходимости обновления виджетов-потомков
    return counter.value != oldWidget.counter.value;
  }

  // Метод of позволяет получить текущий экземпляр CounterProvider из контекста
  static CounterProvider of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<CounterProvider>();
    assert(provider != null, 'CounterProvider не найден');
    return provider!;
  }
}