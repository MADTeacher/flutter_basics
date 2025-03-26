import 'package:flutter/material.dart';
import 'package:tetris/di_container.dart';
import 'package:tetris/features/user/user_entity.dart';

/// Экран игры
class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late final TextEditingController _controller;
  late final Future<UserEntity> _futureUser;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
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
                  final container = DiContainer.of(context);
                  _futureUser = container.userApi.createUser(
                    scores: '0',
                    username: _controller.text,
                  );

                  // Переход на экран игры
                },
                child: Text('Играть'))
          ],
        ),
      ),
    ));
  }
}
