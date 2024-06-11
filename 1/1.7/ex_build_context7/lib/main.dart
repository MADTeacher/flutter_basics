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
            child: MyColorBox(
              color: Colors.red,
              child: MyColorBox(
                color: Colors.green,
                child: Center(
                  child: MyButton(
                    text: 'Second parent',
                    onPressed: secondParentChangeColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Функция для поиска второго родительского MyColorBoxState в
// дереве виджетов для изменения цвета.
void secondParentChangeColor(BuildContext context) {
  final myColorBox = context.findAncestorStateOfType<_MyColorBoxState>();
  final secondColorBox = myColorBox?.context.findAncestorStateOfType<_MyColorBoxState>();
  if (secondColorBox?._color == Colors.red) {
    secondColorBox?.changeColor(Colors.grey);
  } else {
    secondColorBox?.changeColor(Colors.red);
  }
}

class MyButton extends StatelessWidget {
  final void Function(BuildContext context) onPressed;
  final String text;
  const MyButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed(context);
      },
      child: Text(text),
    );
  }
}

class MyColorBox extends StatefulWidget {
  static const padding = 30.0;
  final Color color;
  final Widget? child;

  const MyColorBox({
    super.key,
    required this.color,
    this.child,
  });

  @override
  State<MyColorBox> createState() => _MyColorBoxState();
}

class _MyColorBoxState extends State<MyColorBox> {
  Color _color = Colors.transparent;
  Widget? _child;

  @override
  void initState() {
    super.initState();
    setState(() {
      _color = widget.color;
      _child = widget.child;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        MyColorBox.padding,
      ),
      color: _color,
      child: _child,
    );
  }

  void changeColor(Color color) {
    setState(() {
      _color = color;
    });
  }
}
