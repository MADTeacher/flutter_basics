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
                child: const Text('Click me'),
              ),
              const SizedBox(height: 30),
              FilledButton.icon(
                onPressed: () {},
                label: const Text('Click me'),
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
                child: const Text('Click me'),
              ),
              const SizedBox(height: 30),
              FilledButton.tonalIcon(
                onPressed: () {},
                label: const Text('Click me'),
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
                child: const Text('Click me'),
              ),
              const SizedBox(height: 30),
              OutlinedButton.icon(
                onPressed: () {},
                label: const Text('Click me'),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
