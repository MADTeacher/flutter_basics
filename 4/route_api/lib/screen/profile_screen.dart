import 'package:flutter/material.dart';
import 'package:route_api/example/my_route_delegate.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ProfileScreen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            (Router.of(context).routerDelegate as MyRouterDelegate)
                .setNewRoutePath('/profile/detail');
          },
          child: const Text('Перейти в DetailScreen'),
        ),
      ),
    );
  }
}
