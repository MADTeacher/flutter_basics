import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  final preferences = SharedPreferencesAsync();

  /// Передаем созданный инстанс SharedPreferencesAsync в приложение
  runApp(SharedPrefsExampleApp(preferences: preferences));
}

class SharedPrefsExampleApp extends StatelessWidget {
  const SharedPrefsExampleApp({super.key, required this.preferences});

  final SharedPreferencesAsync preferences;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preferences',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: loadAppSettings,
              child: const Icon(Icons.remove_red_eye),
            ),
            const SizedBox(width: 16),
            FloatingActionButton(
              onPressed: saveAppSettings,
              child: const Icon(Icons.save),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveAppSettings() async {
    // Устанавливаем язык приложения - Русский
    await preferences.setString('selected_language', 'ru');

    // Устанавливаем размер шрифта - 18.0
    await preferences.setDouble('selected_font_size', 18.0);

    // Устанавливаем количество баннеров для показа - 3
    await preferences.setInt('showing_banners_count', 3);

    // Устанавливаем темную тему - true
    await preferences.setBool('is_dark_mode', true);

    // Устанавливаем список предпочтнеий пользователя по новостям
    final categories = ['sport', 'music', 'busines'];
    await preferences.setStringList('favorite_news_categories', categories);
  }

  Future<void> loadAppSettings() async {
    // Поулчаем языка приложения, по умолчанию - Русский
    final language = await preferences.getString('selected_language') ?? 'ru';
    print(language);

    // Поулчаем размер шрифта, по умолчанию - 18.0
    final fontSize = await preferences.getDouble('selected_font_size') ?? 18;
    print(fontSize);

    // Поулчаем количество баннеров для показа, по умолчанию - 3
    final bannersCount = await preferences.getInt('showing_banners_count') ?? 3;
    print(bannersCount);

    // Получаем тему приложения, по умолчанию - true
    final isDarkMode = await preferences.getBool('is_dark_mode') ?? true;
    print(isDarkMode);

    // Получаем список предпочтнеий пользователя по новостям
    final categories = await preferences.getStringList(
      'favorite_news_categories',
    );
    print(categories ?? ['sport', 'music', 'busines']);
  }

  Future<void> saveAppStartTime() async {
    // Сохраняем время последнего открытия приложения
    final nowTime = DateTime.now().toIso8601String();
    await preferences.setString('app_start_time', nowTime);
  }
}
