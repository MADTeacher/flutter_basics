// Миксин для сравнения объектов по их свойствам.
mixin EqualsMixin {
  /// Список свойств для сравнения.
  /// Должен быть переопределен в классе, который использует миксин.
  List<Object?> get fields;

  @override
  bool operator ==(Object other) {
    // Проверяем идентичность объектов или сравниваем их свойства.
    return identical(this, other) ||
        other is EqualsMixin &&
            runtimeType == other.runtimeType &&
            _areListsEqual(fields, other.fields);
  }

  @override
  int get hashCode {
    // Вычисляем хэш-код на основе типа объекта и его свойств.
    return runtimeType.hashCode ^ _combineHashCodes(fields);
  }

  // Приватный метод для сравнения двух списков свойств.
  bool _areListsEqual(List<Object?> a, List<Object?> b) {
    // Используем метод DeepCollectionEquality для сравнения списков.
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  // Приватный метод для комбинирования хэш-кодов всех свойств.
  int _combineHashCodes(List<Object?> objects) {
    // Используем fold для последовательного комбинирования хэш-кодов.
    return objects.fold(
      0,
      (hash, object) => hash ^ (object?.hashCode ?? 0),
    );
  }
}
