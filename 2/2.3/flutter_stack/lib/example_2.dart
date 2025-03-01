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
      home: const MyHomePage(title: 'Stack Example 2'),
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
          title: Text(widget.title),
        ),
        body: Center(
          child: Stack(
            children: [
              Positioned(
                left: 8.0,
                right: 8.0,
                top: 8.0,
                bottom: 8.0,
                child: Container(
                  color: Colors.green,
                ),
              ),
              Positioned(
                left: 16.0,
                right: 16.0,
                top: 16.0,
                child: Container(
                  height: 100,
                  color: Colors.red,
                ),
              ),
              Positioned(
                left: 16.0,
                right: 16.0,
                bottom: 16.0,
                child: Container(
                  height: 100,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ));
  }
}
