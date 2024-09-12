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
  double bottomSheetHeight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Slider(
              value: bottomSheetHeight,
              divisions: 10,
              min: 60,
              max: 200,
              onChanged: (double value) {
                setState(() {
                  bottomSheetHeight = value;
                });
              },
              label: bottomSheetHeight.toStringAsFixed(1),
            ),
            const SizedBox(height: 100),
            const Text(
              '<(˶ᵔᵕᵔ˶)>',
              style: TextStyle(fontSize: 50),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.cyan,
        height: bottomSheetHeight,
        child: const Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.account_balance_wallet),
                  SizedBox(width: 5, height: 5),
                  Text("Stasko Bank")
                ],
              ),
              Row(
                children: [
                  Icon(Icons.phone),
                  SizedBox(width: 5, height: 5),
                  Text("+7(999) xxx-09-42)")
                ],
              )
            ],
          ),
        ),
      ),
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
