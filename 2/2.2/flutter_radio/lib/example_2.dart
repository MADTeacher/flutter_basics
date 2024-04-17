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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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

enum MyColors { red, blue, green }

Color enumToColor(MyColors color) {
  return switch (color) {
    MyColors.red => Colors.red,
    MyColors.blue => Colors.blue,
    MyColors.green => Colors.green,
  };
}

class _MyHomePageState extends State<MyHomePage> {
  var defaultColor = MyColors.red;

  void changeColor(MyColors? color) {
    setState(() {
      defaultColor = color!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            RadioListTile<MyColors>(
              title: const Text('1'), // заголовок
              subtitle: const Text('Red color'), // подзаголовок
              // значение устанавливаемое текущим виджетом
              value: MyColors.red,
              // с каким перечислением работает
              // группа виджетов Radio
              groupValue: defaultColor,
              // функция, вызываемая при изменении значения
              onChanged: changeColor,
            ),
            RadioListTile<MyColors>(
              title: const Text('2'),
              subtitle: const Text('Blue color'),
              value: MyColors.blue,
              groupValue: defaultColor,
              onChanged: changeColor,
            ),
            RadioListTile<MyColors>(
              title: const Text('3'),
              subtitle: const Text('Green color'),
              value: MyColors.green,
              groupValue: defaultColor,
              onChanged: changeColor,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              width: 100,
              color: enumToColor(defaultColor),
            ),
          ],
        ),
      ),
    );
  }
}
