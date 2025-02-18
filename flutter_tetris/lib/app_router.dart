part of 'main.dart';

/// {@template _AppRouter}
///  Роутер приложения.
/// {@endtemplate}
abstract final class AppRouter {
  /// Начальный маршрут.
  static const String initialRoute = '/';

  /// Маршрут игры
  static const String gameRoute = '/game';

  /// Маршрут окончания игры
  static const String gameOverRoute = '/game_over';

  /// Маршруты приложения.
  static final Map<String, WidgetBuilder> _appRoutes = {
    initialRoute: (_) => const RootScreen(),
    gameRoute: (_) => const GameScreen(),
    gameOverRoute: (_) => const GameOverScreen(),
  };
}
