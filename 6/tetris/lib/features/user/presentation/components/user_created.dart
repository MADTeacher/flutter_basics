import 'package:flutter/material.dart';
import 'package:tetris/app/context_ext.dart';
import 'package:tetris/features/user/domain/user_entity.dart';
import 'package:tetris/main.dart';

/// Компонент для отображения данных пользователя
/// при успешном создании
/// [userEntity] - сущность пользователя
class UserCreated extends StatelessWidget {
  const UserCreated({
    super.key,
    required this.userEntity,
  });

  final UserEntity userEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Добро пожаловать, ${userEntity.username}!'),
        SizedBox(height: 16),
        Text('Ваш лучший результат: ${userEntity.score}'),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            // Переход на экран игры
            // при нажатии на кнопку "Начать игру"
            Navigator.pushReplacementNamed(context, GameRouter.gameRoute);
          },
          child: Text('Начать игру'),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            // Выход из аккаунта
            context.di.userCubit.signOut();
          },
          child: Text('Выйти из аккаунта'),
        ),
      ],
    );
  }
}
