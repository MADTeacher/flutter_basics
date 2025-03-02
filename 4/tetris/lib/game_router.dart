part of 'main.dart';

/// {@template GameRouter}
///  Роутер игры.
/// {@endtemplate}
abstract final class GameRouter {
  /// Начальный маршрут.
  static const String initialRoute = '/';

  /// Маршрут игры
  static const String gameRoute = '/game';

  /// Маршрут окончания игры
  static const String gameOverRoute = '/game_over';

  /// Маршруты приложения.
  static final Map<String, WidgetBuilder> _appRoutes = {
    // Рутовый экран
    initialRoute: (_) => const GameStartScreen(),
    // Экран игры
    gameRoute: (_) => const GameScreen(),
    // Экран окончания игры
    gameOverRoute: (_) => const GameOverScreen(),
  };
}
