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
  double firstValue = 0; // текущее значение слайдера

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(height: 50),
          Slider(
            value: firstValue, // текущее значение
            divisions: 20, // количество дискретных делений
            min: 0, // минимальное значение
            max: 2, // максимальное значение
            // функция при изменении значения
            onChanged: (double value) {
              setState(() {
                firstValue = value;
              });
            },
            label: firstValue.round().toString(),
            // Количество дискретных делений
            // Цвет активной части слайдера
            activeColor: Colors.red,
            // Цвет неактивной части слайдера
            inactiveColor: Colors.grey,
            // Цвет слайдера
            thumbColor: Colors.green,
            // Возвращает начальное значения при
            // старте перемещения слайдера
            onChangeStart: (double value) {
              debugPrint('Started change on ${value.round()}');
            },
            // Возвращает конечное значение, устанавливаемое
            // при завершении перемещения слайдера
            onChangeEnd: (double value) {
              debugPrint('Ended change on ${value.round()}');
            },
          ),
          const SizedBox(height: 50),
          Text(
            firstValue.round().toString(),
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
