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
        fontFamily: 'PTSerif',
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
        title: const Text('Flutter Assets Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hello, PTSerif font style!',
              style: TextStyle(
                fontSize: 24,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 20),
            DefaultTextStyle.merge(
              // все текстовые виджеты поддерева будут 
              // использовать этот стиль
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'AmaticSC',
                  color: Colors.blue,
                ),
                child: const Column(
                  children: [
                    Text('Hello, PTSerif font style!'),
                    SizedBox(height: 20),
                    Text('New line AmaticSC font style!'),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
