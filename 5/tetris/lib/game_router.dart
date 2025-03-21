part of 'main.dart';

//  Роутер игры.
abstract final class GameRouter {
  // Начальный маршрут.
  static const String initialRoute = '/';

  // Маршрут игры
  static const String gameRoute = '/game';

  // Маршрут окончания игры
  static const String gameOverRoute = '/game_over';

  // Маршруты приложения. Объявляются приватными, чтобы 
  // исключить к ним доступ вне навигатора
  static final Map<String, WidgetBuilder> _appRoutes = {
    // Рутовый экран - главное меню
    initialRoute: (_) => const MainMenuScreen(),
    // Экран игры
    gameRoute: (_) => const GameScreen(),
    // Экран окончания игры
    gameOverRoute: (_) => const GameOverScreen(),
  };
}
