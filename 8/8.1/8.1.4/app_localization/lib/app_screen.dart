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
  final _nameController = TextEditingController();
  String? _greeting;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // Освобождаем ресурсы
  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  // Считываем введенные пользователем данные и обновляем текст приветствия
  void _updateGreeting(AppLocalizations localizations) {
    if (_nameController.text.trim().isNotEmpty) {
      setState(() {
        _greeting = localizations.hello(_nameController.text.trim());
      });
    }
  }

  // Для обновления текста приветствия в соответствии с изменением локали
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_greeting != null && _nameController.text.trim().isNotEmpty) {
      _updateGreeting(AppLocalizations.of(context));
    }
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
              Row(
                children: [
                  // Поле ввода имени
                  Expanded(
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: localizations.nameHint,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Кнопка отправки
                  ElevatedButton(
                    onPressed: () {
                      _updateGreeting(localizations);
                    },
                    child: Text(localizations.send),
                  ),
                ],
              ),

              // Отображение приветствия, если оно есть
              if (_greeting != null) ...[
                const SizedBox(height: 16),
                Text(
                  _greeting!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],

              const SizedBox(height: 24),
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
                localizations.orderPizzaButton(_counter),
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              // Кнопка заказа пиццы
              ElevatedButton(
                onPressed: () {
                  // Обновляем счетчик заказанных пицц
                  _incrementCounter();
                },
                child: Text(localizations.orderPizza(_counter)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
