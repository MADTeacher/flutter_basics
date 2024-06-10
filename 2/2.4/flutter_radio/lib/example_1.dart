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
            ListTile(
              title: const Text('Red'),
              leading: Radio<MyColors>(
                // значение устанавливаемое текущим виджетом
                value: MyColors.red,
                // с каким перечислением работает
                // группа виджетов Radio
                groupValue: defaultColor,
                // функция, вызываемая при изменении значения
                onChanged: changeColor,
              ),
            ),
            ListTile(
                title: const Text('Blue'),
                leading: Radio<MyColors>(
                  value: MyColors.blue,
                  groupValue: defaultColor,
                  onChanged: changeColor,
                )),
            ListTile(
                title: const Text('Green'),
                leading: Radio<MyColors>(
                  value: MyColors.green,
                  groupValue: defaultColor,
                  onChanged: changeColor,
                )),
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
