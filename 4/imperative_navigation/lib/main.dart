import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: _HomeScreen()));

/// Основный экран приложения
class _HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Главный экран'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Перейти к деталям'),
          onPressed: () {
            // Императивный переход на новый экран
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => _DetailScreen()),
            );
          },
        ),
      ),
    );
  }
}

/// Экран деталей
class _DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Экран деталей'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Вернуться назад'),
          onPressed: () {
            // Императивный возврат к предыдущему экрану
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
