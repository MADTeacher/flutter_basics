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
  bool firstValue = false;
  bool secondValue = false;
  bool thirdValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox(
              // Цвет в активном состоянии
              activeColor: Colors.green,
              // Цвет области активации виджета
              // при наведении на него
              hoverColor: Colors.amber,
              // Цвет галочки
              checkColor: Colors.red,
              value: firstValue, // Начальное состояние
              // Функция, вызываемая при изменении состояния
              onChanged: (bool? value) {
                setState(() {
                  firstValue = value!;
                });
              },
            ),
            CheckboxListTile(
                title: const Text('CheckboxListTile'),
                activeColor: Colors.greenAccent,
                value: secondValue,
                onChanged: (bool? value) {
                  setState(() {
                    secondValue = value!;
                  });
                }),
            CheckboxListTile(
              title: const Text('Second CheckboxListTile'),
              subtitle: const Text('With subtitle'),
              value: thirdValue,
              onChanged: (bool? value) {
                setState(() {
                  thirdValue = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
