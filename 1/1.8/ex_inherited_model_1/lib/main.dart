import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'Flutter Demo Home Page',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter1 = 0;
  int _counter2 = 0;

  void _incrementCounter() {
    _counter1++;
    if (_counter1 % 3 == 0) {
      _counter2++;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('MyHomePage: $_counter1, $_counter2');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(
          context,
        ).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: CounterModel(
        value1: _counter1,
        value2: _counter2,
        child: const Center( // константный виджет
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextWidget1(),
              SizedBox(width: 20),
              MyTextWidget2(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterModel extends InheritedModel<String> {
  final int value1; // значение первого счетчика
  final int value2; // значение второго счетчика

  const CounterModel({
    super.key,
    required super.child,
    required this.value1,
    required this.value2,
  });

  @override
  bool updateShouldNotify(CounterModel oldWidget) {
    return value1 != oldWidget.value1 || value2 != oldWidget.value2;
  }

  // Метод для проверки, есть ли какие-то изменения в 
  // наборе зависимостей аспектов. Возвращает true, если 
  // изменения между текущей и предыдущей моделью (oldWidget) 
  // совпадают с аспектом из множества dependencies.
  @override
  bool updateShouldNotifyDependent(
    CounterModel oldWidget,
    Set<String> dependencies,
  ) {
    final value1Changed = value1 != oldWidget.value1 &&
        dependencies.contains(
          'value1', // имя аспекта
        );
    final value2Changed = value2 != oldWidget.value2 &&
        dependencies.contains(
          'value2', // имя аспекта
        );
    return value1Changed || value2Changed;
  }

  // Методы для подписки на изменения по задаваемому аспекту
  static CounterModel? maybeOf(
    BuildContext context, [
    String? aspect,
  ]) {
    return context.dependOnInheritedWidgetOfExactType<CounterModel>(
      aspect: aspect,
    );
  }

  static CounterModel of(
    BuildContext context, [
    String? aspect,
  ]) {
    final CounterModel? result = maybeOf(context, aspect);
    assert(
      result != null,
      'Unable to find an instance of CounterModel',
    );
    return result!;
  }
}

class MyTextWidget1 extends StatelessWidget {
  const MyTextWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    // подписываемся на изменения value1
    final countValue = CounterModel.of(context, 'value1').value1;
    debugPrint('MyTextWidget1: $countValue');
    return Text(
      '$countValue',
      style: Theme.of(
        context,
      ).textTheme.headlineMedium,
    );
  }
}

class MyTextWidget2 extends StatelessWidget {
  const MyTextWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    // подписываемся на изменения value2
    final countValue = CounterModel.of(context, 'value2').value2;
    debugPrint('MyTextWidget2: $countValue');
    return Text(
      '$countValue',
      style: Theme.of(
        context,
      ).textTheme.headlineMedium,
    );
  }
}
