/// Интерфейс для работы с локальным хранилищем.
abstract interface class IStorageService {
  /// Инициализация локального хранилища.
  /// Вызывается в самом начале приложения.
  Future<void> init();

  /// Сохранить значение по ключу.
  Future<bool> setString(String key, String value);

  /// Получить значение по ключу.
  String? getString(String key);

  /// Удалить все значения.
  Future<bool> clear();
}
