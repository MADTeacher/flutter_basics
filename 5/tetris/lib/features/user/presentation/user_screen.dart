import 'package:flutter/material.dart';
import 'package:tetris/app/di_container.dart';
import 'package:tetris/features/user/domain/state/user_bloc.dart';
import 'package:tetris/features/user/domain/state/user_state.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final userCubit = DiContainer.of(context).userBloc;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ValueListenableBuilder(
            valueListenable: userCubit.stateNotifier,
            builder: (context, value, child) {
              if (value is UserBlocLoading) {
                return CircularProgressIndicator();
              } else if (value is UserBlocSuccess) {
                return Text('Добро пожаловать, ${value.user?.username}!');
              } else if (value is UserBlocError) {
                return Text('Ошибка: ${value.message}');
              }

              return _UsernameField(
                  controller: _controller, userCubit: userCubit);
            },
          ),
        ),
      ),
    );
  }
}

class _UsernameField extends StatelessWidget {
  const _UsernameField({
    required TextEditingController controller,
    required this.userCubit,
  }) : _controller = controller;

  final TextEditingController _controller;
  final UserBloc userCubit;

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
            userCubit.createUser(_controller.text);
          },
          child: Text('Создать пользователя'),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
