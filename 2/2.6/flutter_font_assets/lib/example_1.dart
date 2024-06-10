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

enum FontFamily {
  ptserif('PTSerif'),
  amaticsc('AmaticSC');

  final String family;
  const FontFamily(this.family);
}

class _MyHomePageState extends State<MyHomePage> {
  FontFamily myFontFamily = FontFamily.ptserif;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SegmentedButton<FontFamily>(
                // список сегментов
                segments: <ButtonSegment<FontFamily>>[
                  ButtonSegment<FontFamily>(
                    // значение ButtonSegment
                    value: FontFamily.ptserif,
                    // текст внутри ButtonSegment
                    label: Text(FontFamily.ptserif.family),
                  ),
                  ButtonSegment<FontFamily>(
                    value: FontFamily.amaticsc,
                    label: Text(FontFamily.amaticsc.family),
                  ),
                ],
                selected: <FontFamily>{
                  myFontFamily
                },
                onSelectionChanged: (Set<FontFamily> newSelection) {
                  setState(() {
                    // обновляем текущее значение рейтинга
                    myFontFamily = newSelection.first;
                  });
                }),
            const SizedBox(height: 60),
            Text('Hello, ${myFontFamily.family} font style!',
                style: TextStyle(
                  // указываем семейство шрифта
                  fontFamily: myFontFamily.family,
                  fontSize: 24,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                )),
          ],
        ),
      ),
    );
  }
}
