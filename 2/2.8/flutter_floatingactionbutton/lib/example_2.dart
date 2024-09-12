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

// Cписок расположений FloatingActionButton на Scaffold
const localions = <FloatingActionButtonLocation>[
  FloatingActionButtonLocation.centerDocked,
  FloatingActionButtonLocation.centerFloat,
  FloatingActionButtonLocation.centerTop,
  FloatingActionButtonLocation.endContained,
  FloatingActionButtonLocation.endDocked,
  FloatingActionButtonLocation.endFloat,
  FloatingActionButtonLocation.endTop,
  FloatingActionButtonLocation.startDocked,
  FloatingActionButtonLocation.startFloat,
  FloatingActionButtonLocation.startTop
];
// Варианты размещения, оптимизированные под
// маленькие FloatingActionButton:
// FloatingActionButtonLocation.miniCenterDocked,
// FloatingActionButtonLocation.miniCenterFloat,
// FloatingActionButtonLocation.miniCenterTop,
// FloatingActionButtonLocation.miniEndDocked,
// FloatingActionButtonLocation.miniEndFloat,
// FloatingActionButtonLocation.miniEndTop,
// FloatingActionButtonLocation.miniStartDocked,
// FloatingActionButtonLocation.miniStartFloat,
// FloatingActionButtonLocation.miniStartTop,

class _MyHomePageState extends State<MyHomePage> {
  int indexLocation = 0;

  FloatingActionButtonLocation getLocation() {
    return localions[indexLocation];
  }

  void changeLocation() {
    setState(() {
      if (indexLocation < localions.length - 1) {
        indexLocation++;
      } else {
        indexLocation = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          getLocation().toString().split('.').last,
          style: const TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // По нажатию на кнопку меняется 
        // расположение FloatingActionButton
        onPressed: changeLocation,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: getLocation(),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: null,
        indicatorColor: Colors.cyan,
        selectedIndex: 0,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            tooltip: 'MyHome!!!',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications_none),
            label: 'Notifications',
          ),
        ],
      ),
    );
  }
}
