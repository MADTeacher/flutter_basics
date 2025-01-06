import 'package:flutter/material.dart';

/// Глобальный ключ, связанный с NavigatorState.
/// Позволяет управлять навигацией глобально.
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MaterialApp(
    // Передаем ключ в MaterialApp:
    navigatorKey: navigatorKey,
    home: const HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomeScreen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Обращаемся к глобальному ключу, далее к его текущему
            // состоянию и вызываем нам знакомый метод push()
            navigatorKey.currentState?.push(
              MaterialPageRoute(
                builder: (context) => const SecondScreen(),
              ),
            );
          },
          child: const Text('Перейти на SecondScreen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SecondScreen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Обращаемся к глобальному ключу, далее к его текущему
            // состоянию и вызываем метод pop()
            navigatorKey.currentState?.pop();
          },
          child: const Text('Вернуться назад'),
        ),
      ),
    );
  }
}
