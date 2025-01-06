import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/root_screen.dart';

/// Делегат маршрутов
class MyRouterDelegate extends RouterDelegate<String>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<String> {
  /// Текущее состояние маршрута
  String _currentPath = '/';

  /// Геттер для текущей конфигурации маршрута
  @override
  String? get currentConfiguration => _currentPath;

  /// Список страниц
  List<Page> pages = [];

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [const MaterialPage(child: RootScreen()), ...pages],
      // Обратный вызов, который срабатывает при удалении страницы
      onDidRemovePage: (page) {
        // Удаляем страницу из списка страниц
        pages.remove(page);
        // Обновляем состояние
        if (pages.isEmpty) {
          setNewRoutePath('/');
        }
        notifyListeners();
      },
    );
  }

  Future<void> navigateTo(String url, {String? args}) async {
    Page? newPage;
    // Получаем путь до первого символа ":"
    final path = url.split('/:').first;

    if (path == '/home') {
      newPage = MaterialPage(child: HomeScreen(date: args));
    } else if (path == '/profile') {
      // Получаем путь до первого символа ":" и получаем id
      final id = url.split('/:').last;
      // Передаем id в ProfileScreen
      newPage = MaterialPage(child: ProfileScreen(id: id));
    }

    if (newPage != null) {
      // конфигурируем новую страницу
      // добавляем новую страницу в список
      pages.add(newPage);
    }

    setNewRoutePath(path);
  }

  // Меняем реализацию метода на то, что приведено ниже
  @override
  Future<void> setNewRoutePath(String configuration) async {
    // Обновляем состояние
    _currentPath = configuration;
    if (configuration == '/') {
      // Если текущая страница - корневая, то очищаем список
      pages.clear();
    }

    // Обновляем состояние
    notifyListeners();
  }

  // Удаляем, так как используем PopNavigatorRouterDelegateMixin
  // @override
  // Future<bool> popRoute() {
  //   return Future.value(true);
  // }

  /// Переопределяем параметр ключа навигатора
  @override
  final GlobalKey<NavigatorState>? navigatorKey =
      GlobalKey(debugLabel: "Root navigator");
}
