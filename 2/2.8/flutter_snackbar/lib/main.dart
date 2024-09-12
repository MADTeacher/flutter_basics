import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Scaffold(body: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void showFirstSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Some message!'),
        // если нужно добавить кнопку
        action: SnackBarAction(
          label: "Let's go",
          onPressed: () {
            // обработка нажатия
          },
        ),
        // Добавить иконку для закрытия SnackBar
        showCloseIcon: true,
      ),
    );
  }

  void showSecondSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Some message!'),
        // если нужно добавить кнопку
        action: SnackBarAction(
          label: "Let's go",
          onPressed: () {
            // обработка нажатия
          },
        ),
        // Задаем поведение SnackBar
        behavior: SnackBarBehavior.floating,
        // Задаем форму для SnackBar
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('First SnackBar'),
              onPressed: () {
                showFirstSnackBar(context);
              },
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              child: const Text('Second SnackBar'),
              onPressed: () {
                showSecondSnackBar(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
