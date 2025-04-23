import 'package:flutter/material.dart';
import 'l10n/gen/app_localizations.dart';

class DemoAppScreen extends StatefulWidget {
  const DemoAppScreen({
    super.key,
    required this.onLocaleToggle,
  });

  final VoidCallback onLocaleToggle;

  @override
  State<DemoAppScreen> createState() => _DemoAppScreenState();
}

class _DemoAppScreenState extends State<DemoAppScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            // Вызываем функцию переключения языка
            onPressed: widget.onLocaleToggle, 
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Детали пиццы
              Text(
                localizations.pizzaName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                localizations.pizzaIngredients,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                _counter.toString(),
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              // Кнопка заказа пиццы
              ElevatedButton(
                onPressed: () {
                  // Обновляем счетчик заказанных пицц
                  _incrementCounter();
                },
                child: Text(localizations.orderPizzaButton),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
