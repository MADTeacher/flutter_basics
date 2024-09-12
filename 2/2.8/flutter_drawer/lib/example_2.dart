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

class DestinationData {
  const DestinationData(
    this.label,
    this.icon, [
    this.selectedIcon,
  ]);

  final String label;
  final Widget icon;
  final Widget? selectedIcon;
}

const destinations = <DestinationData>[
  DestinationData(
    'Item 1',
    Icon(Icons.abc),
    Icon(Icons.accessibility_sharp),
  ),
  DestinationData(
    'Item 2',
    Icon(Icons.access_time),
    Icon(Icons.access_time_filled),
  ),
  DestinationData(
    'Item 3',
    Icon(Icons.account_balance_wallet_outlined),
    Icon(Icons.account_balance_wallet),
  ),
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int selectIndex = 0;

  // Метод открытия бокового меню с использованием ключа
  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  // Метод обработки нажатия на элемент меню
  void onItemMenuChange(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // Отключение открытия бокового меню по свайпу
      drawerEnableOpenDragGesture: false,
      endDrawerEnableOpenDragGesture: false,
      drawer: NavigationDrawer(
        // Передаем индекс выбранного элемента
        // в функцию onItemMenuChange
        onDestinationSelected: onItemMenuChange,
        // Устанавливаем индекс текущего выбранного элемента
        selectedIndex: selectIndex,
        children: [
          // Еще один вариант заголовка бокового меню
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.lightBlue,
            ),
            accountName: Text('Account Name'),
            accountEmail: Text('Account Email'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.abc),
            ),
          ),
          // верстаем следующие элементы меню используя
          // список destinations
          ...destinations.map(
            (DestinationData destination) => NavigationDrawerDestination(
              label: Text(destination.label),
              icon: destination.icon,
              selectedIcon: destination.selectedIcon,
            ),
          ),
          // Разделитель
          const Padding(
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
      floatingActionButton: FloatingActionButton(
        // Вызываем метод открытия бокового меню
        onPressed: openDrawer, 
        tooltip: 'Show Drawer',
        child: const Icon(Icons.menu),
      ),
    );
  }
}
