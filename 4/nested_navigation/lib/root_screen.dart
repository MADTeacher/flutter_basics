import 'package:flutter/material.dart';
import 'package:nested_navigation/screens.dart';

/// "Корневой" виджет, который содержит BottomNavigationBar
class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  /// Текущий индекс выбранной вкладки
  int _selectedIndex = 0;

  /// Список ключей навигаторов для каждой вкладки
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(), // для вкладки HomeScreen
    GlobalKey<NavigatorState>(), // для вкладки SearchScreen
    GlobalKey<NavigatorState>(), // для вкладки ProfileScreen
  ];

  /// Метод, который вызывается при нажатии на иконку в BottomNavigationBar
  void _onItemTapped(int index) {
    // Если нажали на уже активную вкладку —
    // сбрасываем стек этой вкладки на первый экран (popUntil isFirst).
    if (index == _selectedIndex) {
      _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _StackNavigation(_selectedIndex, 0, _navigatorKeys),
          _StackNavigation(_selectedIndex, 1, _navigatorKeys),
          _StackNavigation(_selectedIndex, 2, _navigatorKeys),
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

class _StackNavigation extends StatelessWidget {
  const _StackNavigation(this.selectedIndex, this.index, this.navigatorKeys);

  final int selectedIndex;
  final int index;
  final List<GlobalKey<NavigatorState>> navigatorKeys;

  @override
  Widget build(BuildContext context) {
    /// Создаём отдельный Navigator для каждой вкладки, используя Offstage
    /// чтобы скрывать остальные Navigators, когда активен только один.
    return Offstage(
      offstage: selectedIndex != index,
      child: Navigator(
        key: navigatorKeys[index],
        onGenerateRoute: (RouteSettings settings) {
          // Определяем, какой стартовый экран показывать в каждой вкладке
          return switch (index) {
            1 => MaterialPageRoute(builder: (context) => const SearchScreen()),
            2 => MaterialPageRoute(builder: (context) => const ProfileScreen()),
            _ => MaterialPageRoute(builder: (context) => const HomeScreen()),
          };
        },
      ),
    );
  }
}
