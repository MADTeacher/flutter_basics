import 'package:flutter/material.dart';
import 'package:tetris/app/context_ext.dart';
import 'package:tetris/main.dart';

/// Компонент для отображения ошибки
/// при создании пользователя
class UserError extends StatelessWidget {
  const UserError({
    super.key,
    required this.message,
    required this.username,
  });
  /// Сообщение об ошибке
  final String message;
  /// Имя пользователя
  final String username;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(message),
        SizedBox(height: 16),
        // Кнопка для перезапуска создания пользователя 
        ElevatedButton(
          onPressed: () {
            // Сбрасываем состояние кубита
            // чтобы начать процесс создания пользователя заново
            context.di.userCubit.reset();
            // Пробуем снова создать пользователя
            context.di.userCubit.createUser(username);
          },
          child: Text('Попробовать снова'),
        ),
        SizedBox(height: 16),
        // Кнопка для возврата в главное меню
        ElevatedButton(
          onPressed: () {
            // Переход на главный экран приложения
            Navigator.pushReplacementNamed(context, GameRouter.initialRoute);
          },
          child: Text('Вернуться в главное меню'),
        ),
      ],
    );
  }
}
