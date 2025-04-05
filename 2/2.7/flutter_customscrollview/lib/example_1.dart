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
        title: const Text('CustomScrollView example 1'),
      ),
      body: CustomScrollView(
        slivers: [
            SliverAppBar(
                pinned: true,
                floating: true,
                snap: false,
                expandedHeight: 200,
                flexibleSpace: const FlexibleSpaceBar(
                    title: Text('SliverAppBar'),
                    background: FlutterLogo(),
                ),
            ),
            SliverToBoxAdapter(
                child: Container(color: Colors.red, height: 200, width: 200),
            ),
            SliverList.list(
                children: List.generate(
                    10,
                    (int index) => ListTile(title: Text('ListTile index is $index')),
                ),
            ),
            SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
                    crossAxisCount: 2,
                ),
                itemCount: 50,
                itemBuilder: (BuildContext context, int index) => ColoredBox(
                    color: Colors.blue.withAlpha(25),
                    child: Center(child: Text('Item $index')),
                ),
            ),
        ],
      ),
    );
  }
}
