import 'package:flutter/material.dart';

/// Виджет для навигации по стеку страниц
class StackNavigation extends StatelessWidget {
  const StackNavigation({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.pages,
    required this.onResetStack,
  });

  /// Индекс текущей вкладки
  final int index;

  /// Индекс выбранной вкладки
  final int selectedIndex;

  /// Список страниц
  final List<Page> pages;

  /// Обратный вызов для сброса стека
  final VoidCallback onResetStack;

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: selectedIndex != index, // Скрываем, если не выбрана
      child: Navigator(
        // Список страниц
        pages: List.of(pages),
        // Метод, который вызывается при нажатии "назад"
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }
          // Удаляем верхнюю страницу из списка
          pages.removeLast();
          // Сбрасываем стек
          onResetStack();
          return true;
        },
      ),
    );
  }
}
