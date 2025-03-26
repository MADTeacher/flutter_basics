import 'package:flutter/material.dart';
import 'package:tetris/app/context_ext.dart';
import 'package:tetris/main.dart';

class UserError extends StatelessWidget {
  const UserError({
    super.key,
    required this.message,
    required this.username,
  });

  final String message;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(message),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            context.userBloc.createUser(username);
          },
          child: Text('Попробовать снова'),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, GameRouter.initialRoute);
          },
          child: Text('Вернуться в главное меню'),
        ),
      ],
    );
  }
}
