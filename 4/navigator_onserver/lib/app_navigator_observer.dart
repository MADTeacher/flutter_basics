import 'package:flutter/material.dart';

class AppNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
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
