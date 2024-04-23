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
              const Text('Default'),
              const SizedBox(height: 15),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(width: 50),
          Column(
            children: [
              const SizedBox(height: 30),
              const Text('Filled'),
              const SizedBox(height: 15),
              IconButton.filled(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(width: 50),
          Column(
            children: [
              const SizedBox(height: 30),
              const Text('FilledTonal'),
              const SizedBox(height: 15),
              IconButton.filledTonal(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(width: 50),
          Column(
            children: [
              const SizedBox(height: 30),
              const Text('Outlined'),
              const SizedBox(height: 15),
              IconButton.outlined(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
