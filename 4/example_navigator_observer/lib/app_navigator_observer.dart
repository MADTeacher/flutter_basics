import 'package:example_navigator_observer/screens/login_screen.dart';
import 'package:flutter/material.dart';

// Флаг авторизации (для примера)
bool _isUserAuthenticated = false;

class AppNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) async {
    super.didPush(route, previousRoute);
    // Проверяем, если пользователь пытается перейти на профиль
    if (route.settings.name == '/profile' && !_isUserAuthenticated) {
      print('Доступ запрещен, переход на экран аутентификации');

      // Отменяем переход
      WidgetsBinding.instance.addPostFrameCallback((_) {
        navigator?.pop();

        // Перенаправляем на экран аутентификации
        navigator?.push(MaterialPageRoute(
          builder: (context) => const LoginScreen(),
          settings: const RouteSettings(name: '/login'),
        ));
      });
    }

    // Отправить имя маршрута в систему аналитики
    print('Новый маршрут добавлен в стек: ${route.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    // Отправить имя маршрута в систему аналитики
    print('Новый маршрут удален из стека: ${route.settings.name}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    // Отправить имя нового маршрута в систему аналитики
    print(
        'Маршрут заменен: ${oldRoute?.settings.name} на ${newRoute?.settings.name}');
  }
}
