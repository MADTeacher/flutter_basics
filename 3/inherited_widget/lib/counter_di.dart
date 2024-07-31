import 'package:flutter/material.dart';
import 'counter.dart';
import 'counter_provider.dart';

class CounterEmbedder extends StatefulWidget {
  final Widget child; // Дочерний виджет
  final Counter counter; // Счетчик

  const CounterEmbedder({
    super.key,
    required this.child,
    required this.counter,
  });

  @override
  State<CounterEmbedder> createState() => _CounterEmbedderState();
}

class _CounterEmbedderState extends State<CounterEmbedder> {
  late Counter counter;

  @override
  void initState() {
    super.initState();
    // Инициализируем счетчик
    counter = widget.counter; 
  }

  void increment() {
    setState(() {
      counter.increment();
    });
  }

  void decrement() {
    setState(() {
      counter.decrement();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      // Т.к. счетчик передается по ссылке, то для правильной работы
      // CounterProvider необходимо передавать копию счетчика
      counter: counter.copyWith(),
      incrementFunction: increment,
      decrementFunction: decrement,
      child: widget.child,
    );
  }
}
