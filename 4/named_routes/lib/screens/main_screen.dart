import 'package:flutter/material.dart';
import 'package:named_routes/app_routes_name.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MainScreen')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutesName.profile,
                );
              },
              child: const Text(
                'Переход на ProfileScreen',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/unknown');
              },
              child: const Text(
                'Переход на неизвестный маршрут',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/test');
              },
              child: const Text('Переход на тестовый маршрут'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/test',
                  arguments: {
                    'test': true,
                  },
                );
              },
              child: const Text(
                'Переход на тестовый маршрут, с аргументами',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
