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
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(height: 100),
            Text(
              '<(˶ᵔᵕᵔ˶)>',
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          scaffoldKey.currentState!.showBottomSheet((
            BuildContext context,
          ) {
            return SizedBox(
              height: 200,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('BottomSheet'),
                    ElevatedButton(
                      child: const Text('Close'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            );
          }, 
          backgroundColor: Colors.cyan,
          // Если нужно отключить закрытие через свайп, то
          // enableDrag: false,
          );
        },
        child: const Icon(Icons.open_in_browser),
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
