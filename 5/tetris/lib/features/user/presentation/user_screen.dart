import 'package:flutter/material.dart';
import 'package:tetris/app/context_ext.dart';
import 'package:tetris/features/user/domain/state/user_state.dart';
import 'package:tetris/features/user/presentation/components/user_created.dart';
import 'package:tetris/features/user/presentation/components/user_error.dart';
import 'package:tetris/features/user/presentation/components/username_field.dart';

/// Экран создания пользователя
class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  /// Контроллер для текстового поля ввода имени пользователя
  /// Используется для получения текста из текстового поля
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    // Инициализируем контроллер текстового поля
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          // Используем ValueListenableBuilder для отслеживания состояния кубита
          // и обновления UI при изменении состояния
          child: ValueListenableBuilder(
            valueListenable: context.di.userCubit.stateNotifier,
            builder: (context, state, child) {
              return switch (state) {
                // Если состояние кубита - инициализация,
                // то отображаем поле ввода имени пользователя
                UserBlocInit() => UsernameField(controller: _controller),
                // Если состояние кубита - загрузка,
                // то отображаем индикатор загрузки
                UserBlocLoading() => CircularProgressIndicator(),
                // Если состояние кубита - успешное создание пользователя,
                // то отображаем данные пользователя
                UserBlocSuccess() => UserCreated(userEntity: state.userEntity),
                // Если состояние кубита - ошибка,
                // то отображаем сообщение об ошибке
                UserBlocError() => UserError(
                    message: state.message,
                    username: _controller.text,
                  ),
              };
            },
          ),
        ),
      ),
    );
  }
}
