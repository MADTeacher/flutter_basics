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
  DateTime? selectedDate; // выбранная пользователем дата

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 100),
          ElevatedButton(
              child: const Text('Select date'),
              onPressed: () async {
                selectedDate = await showDatePicker(
                  // передаем контекст в showDatePicker
                  context: context,
                  // устанавливаем начальную дату
                  firstDate: DateTime(2020),
                  // устанавливаем конечную дату (год, месяц, день)
                  lastDate: DateTime(2025, 9, 1),
                  // устанавливаем текущую дату
                  currentDate: DateTime.now(),
                  // устанавливаем начальный режим
                  initialEntryMode: DatePickerEntryMode.calendar,
                );
                setState(() {
                  // обновляем состояние
                });
              }),
          const SizedBox(height: 100),
          if (selectedDate != null)
            Text(
              'Selected date: $selectedDate',
              style: const TextStyle(fontSize: 20),
            )
          else
            const Text(
              'Date not selected',
              style: TextStyle(fontSize: 20),
            ),
        ],
      )),
    );
  }
}
