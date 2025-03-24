import 'package:flutter/material.dart';
import 'package:tetris/main.dart';

/// Экран игры
class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _controller = TextEditingController();

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
                  if(_controller.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Введите ваш никнейм'),
                      ),
                    ); 
                    return;
                  }
                  // Переход на экран игры
                  Navigator.pushReplacementNamed(context, GameRouter.gameRoute,
                      arguments: _controller.text);
                },
                child: Text('Играть')),
          ],
        ),
      ),
    ));
  }
}
