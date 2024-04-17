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
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 20),
          Switch(
            // Цвет кружка в неактивном состоянии
            inactiveThumbColor: Colors.brown,
            // Цвет заполнения виджета в неактивном состоянии
            inactiveTrackColor: Colors.blueGrey,
            // Цвет кружка в активном состоянии
            activeColor: Colors.green,
            // Цвет области активации виджета
            // при наведении на него
            hoverColor: Colors.amber,
            // Цвет заполнения виджета в активном состоянии
            activeTrackColor: Colors.red,
            value: firstValue, // Начальное состояние
            // Функция, вызываемая при изменении состояния
            onChanged: (bool? value) {
              setState(() {
                firstValue = value!;
              });
            },
          ),
          SwitchListTile(
              title: const Text('Enable'),
              subtitle: const Text('Enable some widgets'),
              // Добавление иконки в левую часть ListTile
              secondary: const Icon(Icons.settings_display),
              value: isEnabled,
              onChanged: (bool? value) {
                setState(() {
                  isEnabled = value!;
                });
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Switch(                  
                  // Цвет кружка в неактивном состоянии
                  inactiveThumbColor: Colors.brown,
                  // Цвет заполнения виджета в неактивном состоянии
                  inactiveTrackColor: Colors.blueGrey,
                  value: secondValue,
                  // Если onChanged не задан, то виджет
                  // будет неактивным
                  onChanged: !isEnabled
                      ? null
                      : (bool? value) {
                          setState(() {
                            secondValue = value!;
                          });
                        }),
              Checkbox(
                  value: secondValue,
                  onChanged: !isEnabled
                      ? null
                      : (bool? value) {
                          setState(() {
                            secondValue = value!;
                          });
                        })
            ],
          )
        ],
      ),
    );
  }
}
