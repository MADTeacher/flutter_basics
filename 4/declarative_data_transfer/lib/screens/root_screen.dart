import 'package:flutter/material.dart';

import '../router/my_route_delegate.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Передать декларативно данные на другой экран',
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  (Router.of(context).routerDelegate as MyRouterDelegate)
                      .navigateTo(
                    '/home',
                    args: 'Переданные данные из RootScreen',
                  );
                },
                child: const Text('Передать строку')),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                (Router.of(context).routerDelegate as MyRouterDelegate)
                    .navigateTo(
                  '/profile/:10',
                );
              },
              child: const Text('Передать объект'),
            ),
          ],
        ),
      ),
    );
  }
}
