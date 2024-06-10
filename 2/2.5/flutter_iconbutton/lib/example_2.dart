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
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton.filled(
            // обработка нажатия
            onPressed: () {
              setState(() {
                isPressed = !isPressed;
              });
            },
            // установка флага выделения
            isSelected: isPressed,
            // иконка по умолчанию
            icon: const Icon(Icons.add),
            // иконка в выделенном состоянии
            selectedIcon: const Icon(Icons.remove_red_eye),
            // размер иконки
            iconSize: 50,
            // подсказка при наведении на иконку
            tooltip: 'Click me',
          ),
          const SizedBox(height: 30),
          Text(isPressed ? 'Pressed' : 'Not pressed')
        ],
      ),
    ));
  }
}
