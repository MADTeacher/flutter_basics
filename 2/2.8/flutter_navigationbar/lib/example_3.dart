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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int counter = 0;
  int valueIncrement = 1;

  void incrementCounter(int value) {
    setState(() {
      valueIncrement = value;
      counter += value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'AppBar',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            valueIncrement <= 1
                ? ''
                : 'Значение увеличилось на $valueIncrement',
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 10),
          Text(
            '$counter',
            style: const TextStyle(fontSize: 24),
          ),
        ],
      )),
      bottomNavigationBar: BottomAppBar(
        // Т.к. child ожидает на вход объект типа Widget,
        // то наполнение BottomAppBar ограничено только вашей
        // фантазией!!!
        child: Row(
          children: <Widget>[
            // список из IconButton
            IconButton(
              // подсказка
              tooltip: 'Increment on 1',
              // иконка
              icon: const Icon(Icons.merge_type_outlined),
              // обработчик нажатия
              onPressed: () {
                incrementCounter(1);
              },
            ),
            IconButton(
              tooltip: 'Increment on 2',
              icon: const Icon(Icons.search),
              onPressed: () {
                incrementCounter(2);
              },
            ),
            IconButton(
              tooltip: 'Increment on 3',
              icon: const Icon(Icons.settings_input_antenna),
              onPressed: () {
                incrementCounter(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}
