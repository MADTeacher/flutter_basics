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

enum Animals {
  dog('Dog', Colors.deepOrange, Icon(Icons.warning)),
  pig('Pig', Colors.pink, Icon(Icons.wash)),
  snake('Snake', Colors.green, Icon(Icons.sos)),
  lion('Lion', Colors.orange, Icon(Icons.pets)),
  elephant('Elephant', Colors.grey, Icon(Icons.abc));

  const Animals(this.label, this.color, this.icon);
  final String label;
  final Color color;
  final Icon icon;
}

class _MyHomePageState extends State<MyHomePage> {
  final textController = TextEditingController();
  Animals? selectedAnimal;

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          Center(
            child: DropdownMenu(
              // Устанавливаем контроллер
              controller: textController,
              // Подпись области виджета
              label: const Text('Animals'),
              // Обработчик выбора
              onSelected: (Animals? animal) {
                setState(() {
                  selectedAnimal = animal;
                });
              },
              // Список элементов меню
              dropdownMenuEntries:
                  Animals.values.map<DropdownMenuEntry<Animals>>(
                (Animals animal) {
                  return DropdownMenuEntry<Animals>(
                    label: animal.label,
                    leadingIcon: animal.icon,
                    value: animal,
                    enabled: animal != Animals.lion,
                    style: MenuItemButton.styleFrom(
                      foregroundColor: animal.color,
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          const SizedBox(height: 20),
          // Выводим выбранный элемент
          if (selectedAnimal != null)
            Text('You selected ${selectedAnimal!.label}')
          else
            const Text('No Animal Selected')
        ],
      ),
    );
  }
}
