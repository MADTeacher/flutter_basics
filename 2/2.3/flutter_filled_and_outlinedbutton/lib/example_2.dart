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
  @override
  Widget build(BuildContext context) {
    final filledTonalStyle = FilledButton.styleFrom(
        // Форма кнопки
        shape: const ContinuousRectangleBorder(
          side: BorderSide.none,
        ),
        // Отступы
        padding: const EdgeInsets.all(15),
        // Минимальные размеры
        minimumSize: const Size(100, 100),
        // Граница и ее цвет
        side: const BorderSide(
          color: Colors.green,
          width: 10,
        ));

    final filledStyle = FilledButton.styleFrom(
        shape: const StadiumBorder(
          side: BorderSide.none,
        ),
        padding: const EdgeInsets.all(15),
        minimumSize: const Size(100, 100),
        side: const BorderSide(
          color: Colors.black,
          width: 0,
        ));

    final outlinedStyle = FilledButton.styleFrom(
      shape: const StarBorder(),
      padding: const EdgeInsets.all(15),
      minimumSize: const Size(100, 100),
      side: const BorderSide(
        color: Colors.red,
        width: 5,
      ),
    );

    return Scaffold(
        body: Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              const SizedBox(height: 30),
              const Text('FilledButton'),
              const SizedBox(height: 15),
              FilledButton(
                onPressed: () {},
                style: filledStyle,
                child: const Text('Click me'),
              ),
              const SizedBox(height: 30),
              FilledButton.icon(
                onPressed: () {},
                style: filledStyle,
                label: const Text(''),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(width: 50),
          Column(
            children: [
              const SizedBox(height: 30),
              const Text('FilledButton.tonal'),
              const SizedBox(height: 15),
              FilledButton.tonal(
                onPressed: () {},
                style: filledTonalStyle,
                child: const Text('Click me'),
              ),
              const SizedBox(height: 30),
              FilledButton.tonalIcon(
                onPressed: () {},
                style: filledTonalStyle,
                label: const Text(''),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(width: 50),
          Column(
            children: [
              const SizedBox(height: 30),
              const Text('OutlinedButton'),
              const SizedBox(height: 15),
              OutlinedButton(
                onPressed: () {},
                style: outlinedStyle,
                child: const Text('Click'),
              ),
              const SizedBox(height: 30),
              OutlinedButton.icon(
                onPressed: () {},
                style: outlinedStyle,
                label: const Text(''),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
