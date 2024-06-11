import 'package:ex_change_notifier_1/math_model.dart';
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
  final mathModel = MathModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: MyContainer(
        mathModel: mathModel,
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  final MathModel mathModel;
  const MyContainer({super.key, required this.mathModel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Виджеты для ввода первого числа
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'A = ',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 150,
                child: InputValue(
                  onChanged: (String value) {
                    mathModel.firstValue = value;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Виджеты для ввода второго числа
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'B = ',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 150,
                child: InputValue(
                  onChanged: (String value) {
                    mathModel.secondValue = value;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Виджеты кнопок для запуска вычислений
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton(
                onPressed: () => mathModel.add(),
                text: '+',
              ),
              const SizedBox(width: 5),
              MyButton(
                onPressed: () => mathModel.subtract(),
                text: '-',
              ),
              const SizedBox(width: 5),
              MyButton(
                onPressed: () => mathModel.multiply(),
                text: '*',
              ),
              const SizedBox(width: 5),
              MyButton(
                onPressed: () => mathModel.modDivide(),
                text: '%',
              ),
            ],
          ),
          const SizedBox(height: 10),
          ResultText(mathModel: mathModel), // Виджет для вывода результата
        ],
      ),
    );
  }
}

class InputValue extends StatelessWidget {
  final void Function(String value) onChanged;
  const InputValue({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
      onChanged: onChanged,
    );
  }
}

class MyButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;

  const MyButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: Text(text),
    );
  }
}

class ResultText extends StatelessWidget {
  final MathModel mathModel;
  const ResultText({super.key, required this.mathModel});

  @override
  Widget build(BuildContext context) {
    // подписываемся на изменения result используя ListenableBuilder
    return ListenableBuilder(
      listenable: mathModel,
      builder: (BuildContext context, Widget? child) {
        return Text(
          '${mathModel.result ?? 'No result'}',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium,
        );
      },
    );
  }
}
