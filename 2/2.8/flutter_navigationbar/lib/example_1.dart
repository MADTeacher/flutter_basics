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

typedef LabelShowsPolicy = NavigationDestinationLabelBehavior;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;
  int labelShowsIndex = 0;

  void onSelectedItem(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  LabelShowsPolicy getLabelPolicy() {
    final length = LabelShowsPolicy.values.length;
    return LabelShowsPolicy.values[labelShowsIndex % length];
  }

  Widget getCurrentPage() {
    switch (currentPageIndex) {
      case 0:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'My Home Page',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      labelShowsIndex++;
                    });
                  },
                  child: const Text('Swith label shows policy'))
            ],
          ),
        );
      case 1:
        return const Center(
          child: Text(
            'My Notifications Page',
            style: TextStyle(fontSize: 24),
          ),
        );
      default:
        return const Center(
            child: Text(
          'WTF Page???',
        ));
    }
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
      body: getCurrentPage(),
      bottomNavigationBar: NavigationBar(
        // обработка клика на элементе навигационной панели
        onDestinationSelected: onSelectedItem,
        // Цвет фона выбранного элемента
        indicatorColor: Colors.cyan,
        // Индекс выбранной вкладки навигационной панели
        selectedIndex: currentPageIndex,
        // Перечисление настраивающее поведение для отображения
        // текста вкладок навигационной панели
        // onlyShowSelected - отображать только выбранный элемент
        // alwaysShow - всегда отображать текст вкладок
        // alwaysHide - скрыть текст вкладок
        labelBehavior: getLabelPolicy(),
        destinations: const <Widget>[
          // Объявление элементов навигационной панели
          NavigationDestination(
            // Иконка, когда выбрана эта вкладка
            selectedIcon: Icon(Icons.home),
            // Иконка, когда выбрана другая вкладка панели
            icon: Icon(Icons.home_outlined),
            label: 'Home', // текст вкладки
            tooltip: 'MyHome!!!', // текст всплывающей подсказки
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
