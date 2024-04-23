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
  int _count = 0;

  void _fastIncrementCounter() {
    setState(() {
      _count++;
    });
  }

  void _longIncrementCounter() {
    setState(() {
      _count += 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    // стиль без изменения формы кнопки
    final ButtonStyle style = ElevatedButton.styleFrom(
      // размер шрифта текста внутри кнопки
      textStyle: const TextStyle(fontSize: 20),
      // цвет фона кнопки
      backgroundColor: Colors.black54,
      // цвет текста
      foregroundColor: Colors.white,
    );

    // стиль с изменением формы кнопки
    final ButtonStyle styleWitnBorder = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        foregroundColor: Colors.amber,
        backgroundColor: Colors.blue,
        // форма кнопки
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ));

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton( // без стиля                  
                  // обработка обычного нажатия
                  onPressed: _fastIncrementCounter,
                  // обработка долгого нажатия
                  onLongPress: _longIncrementCounter,
                  child: const Text('First'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  // установка стиля
                  style: styleWitnBorder,
                  // обработка обычного нажатия
                  onPressed: () {
                    _fastIncrementCounter();
                  },
                  // обработка долгого нажатия
                  onLongPress: () {
                    setState(() {
                      _count += 2;
                    });
                  },
                  child: const Text('Second'),
                )
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              // установка стиля
              style: style,
              // обработка обычного нажатия
              onPressed: _fastIncrementCounter,
              // обработка долгого нажатия
              onLongPress: _longIncrementCounter,
              // Текст внутри кнопки
              label: const Text('First'),
              // Иконка внутри кнопки
              icon: const Icon(Icons.add_alert),
            ),
            const SizedBox(height: 40),
            Text('Count: $_count'),
          ],
        ),
      ),
    );
  }
}
