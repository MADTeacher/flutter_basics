import 'package:flutter/material.dart';
import 'package:route_api/screen/error_screen.dart';
import 'package:route_api/screen/home_screen.dart';
import 'package:route_api/screen/profile_screen.dart';
import 'package:route_api/screen/root_screen.dart';

class MyRouterDelegate extends RouterDelegate<String> with ChangeNotifier {
  // Текущее состояние маршрута
  String _currentPath = '/';

  // Геттер для текущей конфигурации маршрута
  @override
  String? get currentConfiguration => _currentPath;

  List<Page> pages = [];

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [const MaterialPage(child: RootScreen()), ...pages],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        pages.removeLast();
        _currentPath = '/';
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(String configuration) async {
    Page? newPage = switch (configuration) {
      '/home' => const MaterialPage(child: HomeScreen()),
      '/profile' => const MaterialPage(child: ProfileScreen()),
      '/error' => const MaterialPage(child: ErrorScreen()),
      _ => null,
    };
    _currentPath = configuration;
    if (configuration == '/') {
      pages.clear();
    }
    if (newPage != null) {
      pages.add(newPage);
    }

    notifyListeners();
  }

  @override
  Future<bool> popRoute() async {
    return true;
  }
}
