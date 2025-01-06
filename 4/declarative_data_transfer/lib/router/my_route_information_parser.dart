import 'package:flutter/widgets.dart';

/// Кастомный класс для работы с маршрутами.
/// Наследуется от [RouteInformationParser]
class MyRouteInformationParser extends RouteInformationParser<String> {
  @override
  Future<String> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    // Извлекаем объект Uri из информации о маршруте
    final uri = routeInformation.uri;

    if (uri.path == '/') {
      return '/';
    } else if (uri.path == '/home') {
      return '/home';
    } else if (uri.path == '/profile') {
      // Обработка маршрутов профиля
      return '/profile';
    }
    // Обработка несуществующих маршрутов
    return '/error';
  }

  @override
  RouteInformation? restoreRouteInformation(String configuration) {
    // Преобразуем строку маршрута обратно в RouteInformation
    return RouteInformation(uri: Uri.parse(configuration));
  }
}
