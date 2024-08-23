import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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

final iconList = <IconData>[
  Icons.abc_rounded,
  Icons.zoom_out_map_outlined,
  Icons.access_alarm_outlined,
];

final colorList = <Color>[
  Colors.black,
  Colors.red,
  Colors.green,
  Colors.blue,
];

/// Функция построения слайдера с заданными параметрами
Widget sliderBuilder({
  required String text,
  required double currentValue,
  required double min,
  required double max,
  int? divisions,
  required void Function(double) onChanged,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(text, style: const TextStyle(fontSize: 20)),
      const SizedBox(
        width: 20,
      ),
      Slider(
        value: currentValue,
        min: min,
        max: max,
        divisions: divisions,
        onChanged: onChanged,
      ),
    ],
  );
}

class _MyHomePageState extends State<MyHomePage> {
  int _iconIndex = 0;
  int _colorIndex = 0;
  double _iconSize = 100;

  /// Метод для переключения иконки
  void _switchIcon() {
    setState(() {
      _iconIndex = (_iconIndex + 1) % iconList.length;
    });
  }

  /// Метод для изменения размера иконки
  void _changeIconSize(double newSize) {
    setState(() {
      if (newSize > 30) {
        _iconSize = newSize;
      }
    });
  }

  void _changeIconColor(double index) {
    setState(() {
      _colorIndex = (_colorIndex + 1) % colorList.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              iconList[_iconIndex],
              size: _iconSize,
              color: colorList[_colorIndex],
            ),
            const SizedBox(height: 20),
            sliderBuilder(
              text: 'Размер ',
              currentValue: _iconSize,
              min: 30,
              max: 300,
              divisions: 10,
              onChanged: _changeIconSize,
            ),
            const SizedBox(height: 10),
            sliderBuilder(
              text: 'Цвет ',
              currentValue: _colorIndex.toDouble(),
              min: 0,
              max: 3,
              divisions: 3,
              onChanged: _changeIconColor,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _switchIcon,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
