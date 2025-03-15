import 'package:flutter/material.dart';
import 'l10n/gen/app_localizations.dart';

class DemoAppScreen extends StatefulWidget {
  const DemoAppScreen({super.key, required this.onLocaleToggle});

  final VoidCallback onLocaleToggle;

  @override
  State<DemoAppScreen> createState() => _DemoAppScreenState();
}

class _DemoAppScreenState extends State<DemoAppScreen> {
  // Стартовые значения
  int _integerValue = 1234567;
  double _decimalValue = 1234.56;
  double _percentValue = 0.75;
  double _currencyValue = 1234.56;

  // Метод для обновления значений
  void _updateValues() {
    setState(() {
      _integerValue = (_integerValue * 1.5).round();
      _decimalValue = _decimalValue * 1.25;
      _percentValue = (_percentValue + 0.1) % 1.0; // Между 0 и 1 (1 - 100%)
      _currencyValue = _currencyValue * 1.3;
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
              // Целое число
              Text(
                localizations.formatInteger(_integerValue),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),

              // Дробное число
              Text(
                localizations.formatDecimal(_decimalValue),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),

              // Проценты
              Text(
                localizations.formatPercent(_percentValue),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),

              // Валюта
              Text(
                localizations.formatCurrency(_currencyValue),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 32),

              // Кнопка для обновления значений
              ElevatedButton(
                onPressed: _updateValues,
                child: Text(localizations.updateValues),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
