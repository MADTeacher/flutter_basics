import 'package:flutter/material.dart';
import 'package:route_api/screen/error_screen.dart';
import 'package:route_api/screen/home_screen.dart';
import 'package:route_api/screen/profile_screen.dart';
import 'package:route_api/screen/root_screen.dart';

/// Делегат маршрутов
class MyRouterDelegate extends RouterDelegate<String> with ChangeNotifier {
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

  @override
  Future<void> setNewRoutePath(String configuration) async {
    // Создаем новую страницу
    Page? newPage = switch (configuration) {
      '/home' => const MaterialPage(child: HomeScreen()),
      '/profile' => const MaterialPage(child: ProfileScreen()),
      '/error' => const MaterialPage(child: ErrorScreen()),
      _ => null,
    };
    // Обновляем состояние
    _currentPath = configuration;
    if (configuration == '/') {
      // Если текущая страница - корневая, то очищаем список
      pages.clear();
    }
    if (newPage != null) {
      // конфигурируем новую страницу
      // добавляем новую страницу в список
      pages.add(newPage);
    }
    // Обновляем состояние
    notifyListeners();
  }

  @override
  Future<bool> popRoute() {
    return Future.value(true);
  }
}
