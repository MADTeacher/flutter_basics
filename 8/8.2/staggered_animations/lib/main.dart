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
  late Animation<double> _widthAnimation;
  late Animation<double> _heightAnimation;
  late Animation<Color?> _colorAnimation;
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
    _heightAnimation = Tween<double>(begin: 0, end: 200).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 0.6, curve: Curves.easeInOut),
      ),
    );
    _widthAnimation = Tween<double>(begin: 0, end: 200).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.4, 1, curve: Curves.easeInOut),
      ),
    );
    _colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.6, 1, curve: Curves.easeInOut),
      ),
    );
    _controller.addStatusListener(
            (status) {
          switch(status) {
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
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Staggered animation'),
      ),
      body: Center(
        child: Container(
          color: _colorAnimation.value,
          width: 100 + _widthAnimation.value,
          height: 100 + _heightAnimation.value,
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
