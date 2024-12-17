import 'package:example_data_transfer/declarative/router/my_route_delegate.dart';
import 'package:example_data_transfer/imperative/screen1.dart';
import 'package:example_data_transfer/imperative/screen2.dart';
import 'package:example_data_transfer/test_data.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Передать императивно данные на другой экран'),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const Screen1();
                    },
                    settings: const RouteSettings(
                        arguments: 'Переданные данные из RootScreen'),
                  ));
                },
                child: const Text('Передать строку')),
            const SizedBox(height: 12),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const Screen2();
                    },
                    settings: RouteSettings(
                        arguments: TestData(data: 'Тестовые данные')),
                  ));
                },
                child: const Text('Передать объект')),
            const SizedBox(height: 32),
            const Text('Передать декларативно данные на другой экран'),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  (Router.of(context).routerDelegate as MyRouterDelegate)
                      .navigateTo('/home',
                          args: 'Переданные данные из RootScreen');
                },
                child: const Text('Передать строку')),
            const SizedBox(height: 12),
            ElevatedButton(
                onPressed: () {
                  (Router.of(context).routerDelegate as MyRouterDelegate)
                      .navigateTo('/profile/:10');
                },
                child: const Text('Передать объект')),
          ],
        ),
      ),
    );
  }
}
