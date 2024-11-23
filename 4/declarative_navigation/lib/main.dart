import 'package:flutter/material.dart';

/// [_isAuthenticated] фейковое состояние авторизации
/// Может быть [true] или [false] в реальной жизни
const bool _isAuthenticated = false;

void main() => runApp(const _MyApp());

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    Route
    // Добавляем условие:
    // если [isAuthenticated] == true, то отображается экран _HomeScreen
    // если [isAuthenticated] == false, то отображается экран _AuthScreen
    // Таким образом, приложение будет отображать декларативно экраны в зависимости
    // от состояния [isAuthenticated].
    return MaterialApp.router(
        routeInformationParser: RouteObserver(),
        routeInformationProvider: ,
        home: _isAuthenticated ? _HomeScreen() : const _AuthScreen());
  }
}

/// Домашний экран
class _HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Главный экран'),
      ),
      body: const Center(child: Text('Главный экран')),
    );
  }
}

/// Экран авторизации
/// [_isAuthenticated] состояние авторизации
class _AuthScreen extends StatelessWidget {
  const _AuthScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Экран авторизации'),
      ),
      body: const Center(child: Text('Экран авторизации')),
    );
  }
}
