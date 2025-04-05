import 'package:flutter/widgets.dart';
import 'package:tetris/app/di/depends.dart';

/// Контейнер зависимостей для приложения
final class DiContainer extends InheritedWidget {
  const DiContainer({
    super.key,
    required super.child,
    required this.depends,
  });

  final Depends depends;

  /// Так как контейнер зависимостей нужен только для доступа
  /// к зависимостям – возвращаем false, чтобы виджеты-потомки
  /// не перестраивались при изменении контекста
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  /// Получение контейнера зависимостей из контекста
  static DiContainer of(BuildContext context) {
    // Ищем контейнер зависимостей в контексте
    // Если не нашли, то выбрасываем исключение
    final DiContainer? container =
        context.getInheritedWidgetOfExactType<DiContainer>();
    if (container == null) {
      throw Exception('Контейнер зависимостей не найден в контексте');
    }
    return container;
  }
}
