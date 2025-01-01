part of 'root_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home (Declarative)')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Находим родительский виджет типа _RootScreenState
            final state = context.findAncestorStateOfType<_RootScreenState>();
            // Добавляем новую страницу в стек
            state?._homePages.add(
              MaterialPage(
                key: UniqueKey(), // ключ, чтобы страница была уникальной
                child: const DetailsScreen(
                  title: 'Детали (из Home)',
                ),
              ),
            );
            state?.setState(() {});
          },
          child: const Text('Открыть детальный экран'),
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
      appBar: AppBar(title: const Text('Search (Declarative)')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Находим родительский виджет типа _RootScreenState
            final state = context.findAncestorStateOfType<_RootScreenState>();
            // Добавляем новую страницу в стек
            state?._searchPages.add(
              MaterialPage(
                key: UniqueKey(),
                child: const DetailsScreen(
                  title: 'Детали (из Search)',
                ),
              ),
            );
            state?.setState(() {});
          },
          child: const Text('Открыть детальный экран'),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile (Declarative)')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Находим родительский виджет типа _RootScreenState
            final state = context.findAncestorStateOfType<_RootScreenState>();
            // Добавляем новую страницу в стек
            state?._profilePages.add(
              MaterialPage(
                key: UniqueKey(),
                child: const DetailsScreen(
                  title: 'Детали (из Profile)',
                ),
              ),
            );
            state?.setState(() {});
          },
          child: const Text('Открыть детальный экран'),
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final String title;

  const DetailsScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(child: Text('Детальная информация')),
    );
  }
}
