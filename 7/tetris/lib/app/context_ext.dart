import 'package:flutter/material.dart';
import 'package:tetris/app/di/depends.dart';

import 'di/di_container.dart';

/// Удобный доступ к контейнеру зависимостей
/// из любого места приложения через BuildContext
extension ContextExt on BuildContext {
  Depends get di => DiContainer.of(this).depends;
}
