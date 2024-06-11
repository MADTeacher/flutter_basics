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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyButton(
                        text: 'First parent',
                        onPressed: firstParentChangeColor,
                      ),
                      SizedBox(height: 20),
                      MyButton(
                        text: 'Last parent',
                        onPressed: lastParentChangeColor,
                      )
                    ],
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

// Функция для поиска самого первого родительского MyColorBoxState в
// дереве виджетов (относительно контекста) для изменения цвета.
void firstParentChangeColor(BuildContext context) {
  final myColorBox = context.findAncestorStateOfType<_MyColorBoxState>();
  if (myColorBox?._color == Colors.green) {
    myColorBox?.changeColor(Colors.grey);
  } else {
    myColorBox?.changeColor(Colors.green);
  }
}

// Функция для поиска самого верхнего родительского MyColorBoxState в
// дереве виджетов для изменения цвета.
void lastParentChangeColor(BuildContext context) {
  final myColorBox = context.findRootAncestorStateOfType<_MyColorBoxState>();
  if (myColorBox?._color == Colors.blue) {
    myColorBox?.changeColor(Colors.brown);
  } else {
    myColorBox?.changeColor(Colors.blue);
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
