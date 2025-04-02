import 'package:flutter/material.dart';
import 'package:tetris/app/context_ext.dart';

import '../domain/state/user_state.dart';
import 'components/user_created.dart';
import 'components/user_error.dart';
import 'components/username_field.dart';

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
          // Используем ValueListenableBuilder для отслеживания 
          // состояния кубита и обновления UI при изменении состояния
          child: ValueListenableBuilder(
            valueListenable: context.di.userCubit.stateNotifier,
            builder: (context, state, child) {
              return switch (state) {
                // Если состояние кубита - инициализация,
                // то отображаем поле ввода имени пользователя
                UserInitState() => UsernameField(
                    controller: _controller,
                  ),
                // Если состояние кубита - загрузка,
                // то отображаем индикатор загрузки
                UserLoadingState() => CircularProgressIndicator(),
                // Если пользователь успешно создан,,
                // то отображаем данные пользователя
                UserSuccessState() => UserCreated(
                    userEntity: state.userEntity,
                  ),
                // Если состояние кубита - ошибка,
                // то отображаем сообщение об ошибке
                UserErrorState() => UserError(
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
