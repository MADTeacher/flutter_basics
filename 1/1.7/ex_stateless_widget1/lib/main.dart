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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextWidget(
                text: 'Test1',
              ),
              MyTextWidget(
                text: 'Test2',
                textColor: Colors.indigo,
              ),
              MyTextWidget(
                text: 'Test3',
                textColor: Colors.orange,
                fontSize: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyTextWidget extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  const MyTextWidget(
      {super.key,
      required this.text,
      this.textColor = Colors.black,
      this.fontSize = 14});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: textColor, fontSize: fontSize),
    );
  }
}
