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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
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
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // цвет навигационной панели
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'AppBar',
          style: TextStyle(fontSize: 24),
        ),
        actions: [
          TextButton(
              onPressed: () {
                // переход на новый экран
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewPage(),
                    ));
              },
              child: const Text(
                'Тык!!!',
                style: TextStyle(color: Colors.black87),
              )),
          IconButton(
            onPressed: () {
              // Увеличение счетчика
              setState(() {
                _counter++;
              });
            },
            icon: const Icon(Icons.sailing),
          )
        ],
      ),
      body: Center(
        child: Text(
          '$_counter',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

// Новый экран
class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
