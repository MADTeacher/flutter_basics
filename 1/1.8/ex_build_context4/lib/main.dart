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
      home: const Scaffold(
        body: Center(
          child: MyColorBox(
            color: Colors.blue,
            colorName: 'Blue',
            child: MyColorBox(
              color: Colors.red,
              colorName: 'Red',
              child: MyColorBox(
                color: Colors.green,
                colorName: 'Green',
                child: MyButton(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        debugPrint(
          MyColorBox.ofColor(context)?.toString(),
        );
        debugPrint(
          MyColorBox.of(context)?.colorName,
        );
      },
      child: const Text('Click Me'),
    );
  }
}

class MyColorBox extends StatelessWidget {
  static const padding = 30.0;
  final String colorName;
  final Color color;
  final Widget? child;

  const MyColorBox({
    super.key,
    required this.colorName,
    required this.color,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        MyColorBox.padding,
      ),
      color: color,
      child: child,
    );
  }

  static Color? ofColor(BuildContext context) {
    return context.findAncestorWidgetOfExactType<MyColorBox>()?.color;
  }

  static MyColorBox? of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<MyColorBox>();
  }
}
