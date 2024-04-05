import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return createStyleApp('Flutter Style');
  }
}

Widget createStyleApp(String title){
  var scaffoldWidget = createScaffold(title);
  if (defaultTargetPlatform == TargetPlatform.android) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.grey,
        ),
        useMaterial3: true,
      ),
      home: scaffoldWidget,
    );
  } else {
    return CupertinoApp(
      title: title,
      theme: const CupertinoThemeData(
        brightness: Brightness.light,
      ),
      home: scaffoldWidget,
    );
  }
}

Widget createScaffold(String title) {
  if (defaultTargetPlatform == TargetPlatform.android) {
    return MyMaterialPage(title: title);
  } else {
    return CupertinoPageScaffold(
      child: MyCupertinoPage(title: title),
    );
  }
}

class MyCupertinoPage extends StatefulWidget {
  const MyCupertinoPage({super.key, required this.title});
  final String title;

  @override
  State<MyCupertinoPage> createState() => _MyCupertinoPageState();
}

class _MyCupertinoPageState extends State<MyCupertinoPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.title),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            CupertinoButton.filled(
              onPressed: _incrementCounter,
              child: const Icon(CupertinoIcons.add),
            ),
          ],
        ),
      ),
    );
  }
}

class MyMaterialPage extends StatefulWidget {
  const MyMaterialPage({super.key, required this.title});
  final String title;

  @override
  State<MyMaterialPage> createState() => _MyMaterialPageState();
}

class _MyMaterialPageState extends State<MyMaterialPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
