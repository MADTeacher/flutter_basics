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
        child: Container(
            width: 150,
            height: 50,
            child: const Text(
              'Hello, World!\nHello, new day!\nHello, bad news!',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
              // TextOverflow.ellipsis - для указания переполнения используется ...
              // TextOverflow.visible - отображает переполненный текст за пределами контейнера
              // TextOverflow.clip - обрезает переполняемый текст, закрепляя его в контейнере.
              // TextOverflow.fade - обесцвечивает переполняемый текст до прозрачного
              overflow: TextOverflow.ellipsis,
            )),
      ),
    );
  }
}
