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
              const Text('Enable Button'),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () {},
                child: const Text('Click me'),
              ),
            ],
          ),
          const SizedBox(width: 50),
          const Column(
            children: [
              SizedBox(height: 30),
              Text('Disable Button'),
              SizedBox(height: 15),
              TextButton(
                onPressed: null,
                child: Text('Click me'),
              ),
            ],
          ),
          const SizedBox(width: 50),
          Column(
            children: [
              const SizedBox(height: 30),
              const Text('Styled Button'),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 20,
                  )
                ),
                child: const Text('Click me'),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
