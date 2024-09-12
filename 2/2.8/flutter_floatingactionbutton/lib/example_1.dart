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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Настройки по умолчанию
                  FloatingActionButton(
                    // Обработчик нажатия кнопки
                    onPressed: () {},
                  ),
                  const SizedBox(height: 60),
                  const Text(
                    'Default',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Глубокая кастомизация большой кнопки
                  FloatingActionButton.large(
                    // Обработчик нажатия кнопки
                    onPressed: () {},
                    // Цвет кнопки
                    backgroundColor: Colors.deepOrange,
                    // Цвет текста и иконки внутри кнопки
                    foregroundColor: Colors.limeAccent,
                    // Тиб обрезки краев кнопки
                    clipBehavior: Clip.hardEdge,
                    // Зануляем heroTag, чтобы сделать вложенный
                    // FloatingActionButton
                    heroTag: null,
                    // Подсказка при наведении на кнопку
                    tooltip: 'Уииииииииии!!!',
                    // Цвет наполнения при нажатии на кнопку
                    splashColor: Colors.black,
                    // Задаем форму кнопки
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(90),
                    ),
                    // Добавляем вложенный FloatingActionButton
                    child: FloatingActionButton(
                      onPressed: () {},
                      mini: true, // Мини-кнопка
                      child: const Icon(Icons.monetization_on_rounded),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Large',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Мини-кнопка
                  FloatingActionButton.small(
                    onPressed: () {},
                    child: const Icon(Icons.disc_full_rounded),
                  ),
                  const SizedBox(height: 80),
                  const Text(
                    'Small',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Расширенная кнопка
                  FloatingActionButton.extended(
                    onPressed: () {},
                    // Текст внутри кнопки
                    label: const Text('Тык!!!'),
                    // Иконка внутри кнопки
                    icon: const Icon(Icons.sd_card),
                    // Расстояние между иконкой и текстом
                    extendedIconLabelSpacing: 20,
                    // Отступы внутри кнопки
                    extendedPadding: const EdgeInsets.all(10),
                    // Стиль текста внутри кнопки
                    extendedTextStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 60),
                  const Text(
                    'Extended',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
