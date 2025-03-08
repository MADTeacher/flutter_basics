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
      home: const MyHomePage(title: 'Row Example 1'),
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
          child: Wrap(
            spacing: 8.0,
            alignment: WrapAlignment.end,
            runSpacing: 8.0,
            runAlignment: WrapAlignment.end,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Container(width: 100, height: 150, color: Colors.red),
              Container(width: 100, height: 100, color: Colors.blue),
              Container(width: 100, height: 150, color: Colors.green),
              Container(width: 100, height: 100, color: Colors.yellow),
              Container(width: 100, height: 150, color: Colors.purple),
            ],
          ),
        ));
  }
}
