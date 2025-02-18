import 'package:flutter/material.dart';

/// {@template GameOverScreen}
///  Экран окончания игры
/// {@endtemplate}
class GameOverScreen extends StatelessWidget {
  /// {@macro GameOverScreen}
  const GameOverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Получаем заработанные очки, переданные в маршрут
    final args = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Игра закончена'),
            SizedBox(height: 20),
            Text('Заработанные очки: $args'),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  // Переход на экран игры
                  Navigator.pushReplacementNamed(context, '/game');
                },
                child: Text('Попробовать еще раз'))
          ],
        ),
      ),
    );
  }
}
