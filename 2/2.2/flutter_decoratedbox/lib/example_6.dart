import 'dart:math' as Math;

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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('DecoratedBox example 6'),
      ),
      body: SizedBox(
        height: 100,
        width: 100,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: SweepGradient(
              colors: [Colors.yellow, Colors.green],
              center: Alignment(0.1, -0.1),
              startAngle: 0.1,
              endAngle: Math.pi * 2,
            ),
          ),
        ),
      ),
    );
  }
}
