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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late final ColorTween _colorTween;
  late final Tween<double> _sizeTween;
  late AnimationController _controller;
  bool _animated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..addListener(() {
      setState(() {});
    });
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _colorTween = ColorTween(begin: Colors.blue, end: Colors.red);
    _sizeTween = Tween<double>(begin: 0, end: 200);
    _controller.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.completed:
        case AnimationStatus.reverse:
          setState(() {
            _animated = true;
          });
          break;
        case AnimationStatus.dismissed:
        case AnimationStatus.forward:
          setState(() {
            _animated = false;
          });
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Custom animation'),
      ),
      body: Center(
        child: Container(
          color: _colorTween.evaluate(_animation),
          width: 100 + _sizeTween.evaluate(_animation),
          height: 100 + _sizeTween.evaluate(_animation),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (!_animated) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
