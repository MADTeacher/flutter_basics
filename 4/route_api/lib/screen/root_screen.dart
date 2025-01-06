import 'package:flutter/material.dart';
import 'package:route_api/example/my_route_delegate.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RootScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                // Получаем из контекста MyRouterDelegate
                // и вызываем setNewRoutePath с новой конфигурацией
                (Router.of(context).routerDelegate as MyRouterDelegate)
                    .setNewRoutePath('/home');
              },
              child: const Text('Перейти на HomeScreen'),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                (Router.of(context).routerDelegate as MyRouterDelegate)
                    .setNewRoutePath('/profile');
              },
              child: const Text('Перейти на ProfileScreen'),
            ),
          ],
        ),
      ),
    );
  }
}
