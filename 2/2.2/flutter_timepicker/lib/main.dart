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
  bool is24HourTime = true;
  TimeOfDay? selectedTime; // выбранное пользователем время

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 100),
          SwitchListTile(
              title: Text(
                is24HourTime ? '24-hour time' : '12-hour time',
              ),
              value: is24HourTime,
              onChanged: (value) {
                setState(() {
                  is24HourTime = value;
                });
              }),
          ElevatedButton(
              child: const Text('Select time'),
              onPressed: () async {
                selectedTime = await showTimePicker(
                  // Подпись в верху диалогового виджета
                  barrierLabel: 'Select time',
                  // передаем контекст в showTimePicker
                  context: context,
                  // устанавливаем начальное время
                  initialTime: selectedTime ?? TimeOfDay.now(),
                  // устанавливаем начальный режим
                  initialEntryMode: TimePickerEntryMode.dial,
                  // устанавливаем ориентацию
                  orientation: Orientation.portrait,
                  // устанавливаем формат времени
                  builder: (context, child) {
                    return MediaQuery(
                      data: MediaQuery.of(context).copyWith(
                        alwaysUse24HourFormat: is24HourTime,
                      ),
                      child: child!,
                    );
                  },
                );
                setState(() {
                  // обновляем состояние
                });
              }),
          const SizedBox(height: 100),
          if (selectedTime != null)
            Text(
              'Selected time: ${selectedTime!.format(context)}',
              style: const TextStyle(fontSize: 20),
            )
          else
            const Text(
              'No time selected',
              style: TextStyle(fontSize: 20),
            ),
        ],
      ),
    );
  }
}
