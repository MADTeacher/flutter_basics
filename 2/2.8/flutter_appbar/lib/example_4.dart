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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    // length - количество вкладок
  }

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
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            // Варианты вкладок
            Tab(icon: Icon(Icons.add)),
            Tab(text: 'Tab 2'),
            Tab(text: 'Tab 3', icon: Icon(Icons.add_a_photo)),
          ],
        ),
      ),
      body: TabBarView(
        // Контроллер будет автоматически, при изменении 
        // состояния, переключать вкладки виджета TabBarView.
        controller: _tabController,
        // Виджеты, отображаемые на вкладках
        children: const [ 
          Center( // первая вкладка
              child: Text(
            'Tab 1',
            style: TextStyle(fontSize: 24),
          )),
          Center( // вторая вкладка
              child: Text(
            'Tab 2',
            style: TextStyle(fontSize: 22),
          )),
          Center( // третья вкладка
              child: Text(
            'Tab 3',
            style: TextStyle(fontSize: 26),
          )),
        ],
      ),
    );
  }
}
