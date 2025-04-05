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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('CustomScrollView example 2'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList.list(
            children: List.generate(
              20,
              (int index) => ListTile(title: Text('ListTile index is $index')),
            ),
          ),
          SliverPersistentHeader(
            delegate: AppPersistentHeaderDelegate(title: 'Header'),
            pinned: true,
          ),
          SliverList.list(
            children: List.generate(
              20,
              (int index) =>
                  ListTile(title: Text('ListTile index is ${index + 10}')),
            ),
          ),
        ],
      ),
    );
  }
}

class AppPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  AppPersistentHeaderDelegate({required this.title});

  @override
  double minExtent = 100;

  @override
  double maxExtent = 250;

  @override
  bool shouldRebuild(AppPersistentHeaderDelegate oldDelegate) => false;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: Colors.white, child: Center(child: Text(title)));
  }
}
