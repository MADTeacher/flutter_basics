import 'package:flutter/material.dart';
import 'package:tetris/app/di_container.dart';
import 'package:tetris/features/user/domain/state/user_state.dart';
import 'package:tetris/features/user/presentation/widgets/user_created.dart';
import 'package:tetris/features/user/presentation/widgets/user_error.dart';
import 'package:tetris/features/user/presentation/widgets/username_field.dart';

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
              return switch (value) {
                UserBlocLoading() => CircularProgressIndicator(),
                UserBlocSuccess() => UserCreated(userEntity: value.user!),
                UserBlocError() => UserError(
                    message: value.message,
                    username: _controller.text,
                  ),
                _ => UsernameField(controller: _controller),
              };
            },
          ),
        ),
      ),
    );
  }
}
