import 'package:example_data_transfer/test_data.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as TestData;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(args.data),
      ),
    );
  }
}
