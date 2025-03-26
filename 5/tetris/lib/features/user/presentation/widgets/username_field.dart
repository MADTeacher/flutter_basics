import 'package:flutter/material.dart';
import 'package:tetris/app/context_ext.dart';

class UsernameField extends StatelessWidget {
  const UsernameField({
    super.key,
    required TextEditingController controller,
  }) : _controller = controller;

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
            context.userBloc.createUser(_controller.text);
          },
          child: Text('Создать пользователя'),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
