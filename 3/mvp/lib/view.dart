/// Представление (View). Интерфейс для View-компонентов.
/// Уведомляет UI компонент о изменении значения счетчика.
abstract interface class View {
  void updateCounter(int value);
}