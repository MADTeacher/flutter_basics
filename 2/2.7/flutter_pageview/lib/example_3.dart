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
  final _controller = PageController();
  int _currentPage = 0;

  void _animateToNext() {
    _controller.animateToPage(
      _currentPage == 2 ? 0 : _currentPage + 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _animateToPrev() {
    _controller.animateToPage(
      _currentPage == 0 ? 2 : _currentPage - 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('PageView example 3'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                 onPageChanged: (pageIndex) {
                  setState(() {
                    _currentPage = pageIndex;
                  });
                },
                controller: _controller,
                children: [
                  Center(child: Text('Page One')),
                  Center(child: Text('Page Two')),
                  Center(child: Text('Page Three')),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: _animateToPrev,
                  icon: Icon(Icons.chevron_left),
                ),
                IconButton(
                  onPressed: _animateToNext,
                  icon: Icon(Icons.chevron_right),
                ),
              ],
            ),
            const SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }
}
