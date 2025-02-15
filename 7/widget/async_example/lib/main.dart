import 'package:flutter/material.dart';

void main() => runApp(Example());

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  Future<String>? _futureData;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
          FutureBuilder<String>(
            future: _futureData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Если данные загружаются, отображаем индикатор загрузки
                return CircularProgressIndicator();
              }
              if (snapshot.hasData) {
                return Text(snapshot.data!);
              }
              return Text('Нужно загрузить данные');
            },
          ),
          SizedBox(height: 16),
          ElevatedButton(
              onPressed: () {
                _futureData = _downloadData();
                setState(() {});
              },
              child: Text('Загрузить данные'))
        ]))));
  }

  /// Метод имитирует загрузку данных
  Future<String> _downloadData() async {
    await Future.delayed(Duration(seconds: 2));
    return 'Данные загружены';
  }
}
