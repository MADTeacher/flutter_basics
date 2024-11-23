import 'package:flutter/material.dart';
import 'package:navigator_onserver/screens/home_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ProfileScreen')),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const HomeScreen(),
                settings: const RouteSettings(name: '/home'),
              ));
            },
            child: const Text('Переход на HomeScreen')),
      ),
    );
  }
}
