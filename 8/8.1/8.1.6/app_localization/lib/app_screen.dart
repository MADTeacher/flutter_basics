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
  DateTime? _currentDateTime;

  void _updateDateTime() {
    setState(() {
      _currentDateTime = DateTime.now();
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
              // Обычный формат даты
              Text(
                _currentDateTime == null
                    ? 'Date not selected'
                    : localizations.dateFormat1(_currentDateTime!),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),

              // Полный формат даты
              Text(
                _currentDateTime == null
                    ? 'Date not selected'
                    : localizations.dateFormat2(_currentDateTime!),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),

              // Отображаем время
              Text(
                _currentDateTime == null
                    ? 'Date not selected'
                    : localizations.timeFormat(_currentDateTime!),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),

              // Объединенный формат даты и времени
              Text(
                _currentDateTime == null
                    ? 'Date not selected'
                    : localizations.dateTimeFormat(_currentDateTime!),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 32),

              // Кнопка для обновления даты и времени
              ElevatedButton(
                onPressed: _updateDateTime,
                child: Text(localizations.updateDateTime),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
