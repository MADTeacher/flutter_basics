import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Открыть детальный экран'),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const DetailsScreen()),
            );
          },
        ),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: const Center(child: Text('Поиск')),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: const Center(child: Text('Профиль пользователя')),
    );
  }
}

/// Пример дополнительного экрана, чтобы показать,
/// что в каждой вкладке есть свой независимый стек
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Детали')),
      body: const Center(
        child: Text('Экран для детального описания'),
      ),
    );
  }
}
