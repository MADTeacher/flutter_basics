import 'package:flutter/material.dart';

import 'di_container.dart';

/// Удобный доступ к контейнеру зависимостей
/// из любого места приложения через BuildContext
extension ContextExt on BuildContext {
  DiContainer get di => DiContainer.of(this);
}
