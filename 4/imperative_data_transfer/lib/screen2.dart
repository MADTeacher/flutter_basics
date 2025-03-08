import 'package:flutter/material.dart';
import 'test_data.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    // Получаем аргументы из RouteSettings
    final args = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(args == null ? 'No data' : (args as TestData).data),
      ),
    );
  }
}
