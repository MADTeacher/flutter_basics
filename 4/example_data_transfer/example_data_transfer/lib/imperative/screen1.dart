import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    // Получаем аргументы из RouteSettings
    final args = ModalRoute.of(context)?.settings.arguments ?? 'No data';
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(args.toString()),
      ),
    );
  }
}
