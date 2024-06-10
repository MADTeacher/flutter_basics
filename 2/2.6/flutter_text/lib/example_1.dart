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

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, World!\nHello, new day!\nHello, bad news!',
          // стиль текста (например, жирный, курсив и т.д.)
          style: TextStyle(
            // размер шрифта
            fontSize: 30,
            // толщина шрифта
            fontWeight: FontWeight.bold,
            // цвет шрифта
            color: Colors.red,
            // семейство шрифта
            fontFamily: 'Roboto',
            // стиль шрифта
            // FontStyle.italic - курсив
            // FontStyle.normal - обычный (по умолчанию)
            fontStyle: FontStyle.italic
          ),
          // textAlign управляет тем, как текст будет выравниван внутри
          // контейнера (например, по центру, по левой стороне и т.д.)
          // TextAlign.left - по левой стороне (по умолчанию)
          // TextAlign.center - по центру
          // TextAlign.right - по правой стороне
          // TextAlign.justify - по ширине
          // TextAlign.start - по верхнему краю контейнера
          // TextAlign.end - по нижнему краю контейнера
          textAlign: TextAlign.center,
          // textDirection управляет направлением текста
          // TextDirection.ltr - слева направо (по умолчанию)
          // TextDirection.rtl - справа налево
          textDirection: TextDirection.ltr,
          // maxLines - максимальное количество строк в тексте
          maxLines: 2,
        ),
      ), 
    );
  }
}
