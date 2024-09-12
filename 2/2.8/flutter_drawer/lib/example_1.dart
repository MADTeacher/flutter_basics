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
  int selectIndex = 0;

  // Обрабатываем нажатие на элемент меню
  void onItemMenuChange(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'AppBar',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
      drawer: NavigationDrawer(
        // Передаем индекс выбранного элемента
        // в функцию onItemMenuChange
        onDestinationSelected: onItemMenuChange,
        // Устанавливаем индекс текущего выбранного элемента
        selectedIndex: selectIndex,
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.lightBlue,
            ),
            child: Text('Drawer Header'),
          ),
          // Первый элемент меню
          NavigationDrawerDestination(
            label: Text('Item 1'),
            icon: Icon(Icons.abc),
            selectedIcon: Icon(Icons.accessibility_sharp),
          ),
          // Второй элемент меню
          NavigationDrawerDestination(
            label: Text('Item 2'),
            icon: Icon(Icons.access_time),
            selectedIcon: Icon(Icons.access_time_filled),
          ),
          // Третий элемент меню
          NavigationDrawerDestination(
            label: Text('Item 3'),
            icon: Icon(Icons.account_balance_wallet_outlined),
            selectedIcon: Icon(Icons.account_balance_wallet),
          ),
          // Разделитель
          Padding(
            padding: EdgeInsets.fromLTRB(20, 12, 20, 10),
            child: Divider(),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Current Menu Index = $selectIndex',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
