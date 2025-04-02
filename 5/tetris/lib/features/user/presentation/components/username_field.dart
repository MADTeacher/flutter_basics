import 'package:flutter/material.dart';
import 'package:tetris/app/context_ext.dart';

/// Поле для ввода имени пользователя 
/// с кнопкой, запускающей процесс его создания
class UsernameField extends StatelessWidget {
  const UsernameField({
    super.key,
    required TextEditingController controller,
  }) : _controller = controller;

  /// Контроллер текстового поля
  /// Используется для получения текста из текстового поля
  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Введите ваш никнейм:'),
        SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Никнейм',
          ),
          controller: _controller,
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            if (_controller.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Введите ваш никнейм'),
                ),
              );
              return;
            }

            /// Вызываем метод создания пользователя из кубита и
            /// передаем никнейм из текстового поля 
            /// (используя контроллер)
            context.di.userCubit.createUser(_controller.text);
          },
          child: Text('Создать пользователя'),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
