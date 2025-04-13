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
      home: const HeroPageOne(),
    );
  }
}

class HeroPageOne extends StatelessWidget {
  const HeroPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Hero example Page 1'),
      ),
      body: Center(
        child: Hero(tag: 'logo_widget_hero', child: FlutterLogo(size: 200)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => HeroPageTwo())),
      ),
    );
  }
}

class HeroPageTwo extends StatelessWidget {
  const HeroPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Hero example Page 2'),
      ),
      body: Center(
        child: Hero(
          tag: 'logo_widget_hero',
          child: FlutterLogo(size: MediaQuery.of(context).size.width),
        ),
      ),
    );
  }
}
