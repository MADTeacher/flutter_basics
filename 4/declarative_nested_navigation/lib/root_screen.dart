import 'package:flutter/material.dart';

import 'stack_navigation.dart';

part 'screens.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  // Текущий индекс выбранной вкладки
  int _selectedIndex = 0;

  // Для каждой вкладки храним собственный список Page
  final List<Page> _homePages = [
    const MaterialPage(
      child: HomeScreen(),
      key: ValueKey('HomeRootPage'),
    ),
  ];

  final List<Page> _searchPages = [
    const MaterialPage(
      child: SearchScreen(),
      key: ValueKey('SearchRootPage'),
    ),
  ];

  final List<Page> _profilePages = [
    const MaterialPage(
      child: ProfileScreen(),
      key: ValueKey('ProfileRootPage'),
    ),
  ];

  // Метод для сброса стека (например, при повторном клике
  // на иконку вкладки)
  void _resetStack(int index) {
    setState(() {
      switch (index) {
        case 0:
          _homePages
            ..clear()
            ..add(const MaterialPage(
              child: HomeScreen(),
              key: ValueKey('HomeRootPage'),
            ));
          break;
        case 1:
          _searchPages
            ..clear()
            ..add(const MaterialPage(
              child: SearchScreen(),
              key: ValueKey('SearchRootPage'),
            ));
          break;
        case 2:
          _profilePages
            ..clear()
            ..add(const MaterialPage(
              child: ProfileScreen(),
              key: ValueKey('ProfileRootPage'),
            ));
          break;
      }
    });
  }

  void _onItemTapped(int index) {
    if (index == _selectedIndex) {
      // Если снова нажали на активную вкладку — сбрасываем стек
      _resetStack(index);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Список страниц для текущей вкладки
    final listPages = switch (_selectedIndex) {
      0 => _homePages,
      1 => _searchPages,
      2 => _profilePages,
      _ => throw Exception('Unknown index: $_selectedIndex'),
    };
    return Scaffold(
      body: Stack(
        children: [
          for (var i = 0; i < 3; i++)
            StackNavigation(
              index: i,
              selectedIndex: _selectedIndex,
              pages: listPages,
              onResetStack: () => _resetStack(i),
            ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
