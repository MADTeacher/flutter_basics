import 'package:flutter/material.dart';
import 'package:navigator_onserver/screens/profile_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MainScreen')),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
                settings: const RouteSettings(name: '/profile'),
              ));
            },
            child: const Text('Переход на ProfileScreen')),
      ),
    );
  }
}
