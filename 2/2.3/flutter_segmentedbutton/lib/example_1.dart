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

enum CreditRating {
  aaa('AAA'),
  aaPlus('AA+'),
  cMinus('C-');

  final String text;
  const CreditRating(this.text);
}

class _MyHomePageState extends State<MyHomePage> {
  CreditRating currentRating = CreditRating.aaa;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        const SizedBox(height: 60),
        SegmentedButton<CreditRating>(
            // список сегментов
            segments: <ButtonSegment<CreditRating>>[
              ButtonSegment<CreditRating>(
                // значение ButtonSegment
                value: CreditRating.aaa,
                // текст внутри ButtonSegment
                label: Text(CreditRating.aaa.text),
              ),
              ButtonSegment<CreditRating>(
                value: CreditRating.aaPlus,
                label: Text(CreditRating.aaPlus.text),
              ),
              ButtonSegment<CreditRating>(
                value: CreditRating.cMinus,
                label: Text(CreditRating.cMinus.text),
              )
            ],
            selected: <CreditRating>{
              currentRating
            },
            onSelectionChanged: (Set<CreditRating> newSelection) {
              setState(() {
                // обновляем текущее значение рейтинга
                currentRating = newSelection.first;
              });
            }),
        const SizedBox(height: 20),
        Text(
          currentRating.text,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    )));
  }
}
