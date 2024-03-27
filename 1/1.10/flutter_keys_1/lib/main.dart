import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyan,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'Flutter WTF Page',
      ),
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
  // Список для замены виджетов местами
  var emojiListWidgets = <EmojiWidget>[
    EmojiWidget(
      emoji: "¯\\_(ツ)_/¯",
    ),
    EmojiWidget(
      emoji: "(⊙ _ ⊙ )",
    ),
  ];

  void _swapWidgets() {
    setState(() {
      emojiListWidgets.insert(
        1,
        emojiListWidgets.removeAt(0),
      );
    });
    debugPrint(emojiListWidgets.toString());
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Building MyHomePage");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: emojiListWidgets,
            ),
            ElevatedButton(
              onPressed: _swapWidgets,
              child: const Text(
                "Swap Widgets",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EmojiWidget extends StatefulWidget {
  final String emoji;
  const EmojiWidget({super.key, required this.emoji});

  @override
  State<EmojiWidget> createState() => _EmojiWidgetState();

  @override
  String toString({
    // для вывода в консоль
    DiagnosticLevel minLevel = DiagnosticLevel.info,
  }) {
    return emoji;
  }
}

class _EmojiWidgetState extends State<EmojiWidget> {
  late String emoji;

  @override
  void initState() {
    super.initState();
    emoji = widget.emoji;
    debugPrint('Init $emoji');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Building $emoji");
    return Text(
      emoji,
      style: const TextStyle(
        fontSize: 80,
      ),
    );
  }
}
