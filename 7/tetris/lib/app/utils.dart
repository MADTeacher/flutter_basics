import 'package:flutter/material.dart';
import 'package:tetris/app/context_ext.dart';
import 'package:tetris/features/user/domain/state/user_state.dart';

/// Утилиты для работы с приложением
/// Содержит методы, которые могут быть полезны в разных частях приложения
abstract class Utils {
  // Получаем имя пользователя из состояния кубита
  // Если состояние кубита - успешная загрузка,
  // то возвращаем имя пользователя
  // Если любое другое состояние, то возвращаем 'Гость'
  static String getUsername(
    BuildContext context,
  ) {
    final state = context.di.userCubit.stateNotifier.value;
    if (state is UserSuccessState) {
      return state.userEntity.username;
    } else {
      return 'Гость';
    }
  }
}
