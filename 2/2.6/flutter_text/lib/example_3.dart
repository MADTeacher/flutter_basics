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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //
            // пример использования именованного конструктора Text.rich
            //
            const Text.rich(
              TextSpan(
                text: 'Hello, ',
                children: <TextSpan>[
                  TextSpan(
                    text: 'Text ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'widget!',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              // распространяется на все TextSpan, которые не
              // переопределяют стиль
              style: TextStyle(
                fontSize: 24,
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            //
            // пример использования виджета RichText
            //
            RichText(
              text: const TextSpan(
                  text: 'Hello, ',
                  // распространяется на все TextSpan, которые не
                  // переопределяют стиль
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.blue,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'RichText ',
                        style: TextStyle(
                          fontSize: 20,
                        )),
                    TextSpan(
                        text: 'widget!',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.red,
                        ))
                  ]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
