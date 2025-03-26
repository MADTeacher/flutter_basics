import 'package:flutter/material.dart';
import 'package:tetris/features/board/board_api.dart';
import 'package:tetris/features/http/i_http_client.dart';
import 'package:tetris/features/http/my_http_client.dart';
import 'package:tetris/features/user/user_api.dart';

/// Контейнер зависимостей
final class DiContainer extends InheritedWidget {
  DiContainer({super.key, required super.child}) {
    httpClient = MyHttpClient();
    userApi = UserApi(httpClient: httpClient);
    boardApi = BoardApi(httpClient: httpClient);
  }
  late final IHttpClient httpClient;
  late final UserApi userApi;
  late final BoardApi boardApi;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // Сравниваем текущее значение counter с предыдущим
    // Возвращаем true, если значения не равны, что сигнализирует
    // о необходимости обновления виджетов-потомков
    return this != oldWidget;
  }

  /// Получение контейнера зависимостей из контекста
  static DiContainer of(BuildContext context) {
    final DiContainer? container =
        context.getInheritedWidgetOfExactType<DiContainer>();
    if (container == null) {
      throw Exception('Контейнер зависимостей не найден в контексте');
    }
    return container;
  }
}
