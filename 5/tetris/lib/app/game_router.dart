part of '../main.dart';

//  Роутер игры.
abstract final class GameRouter {
  // Начальный маршрут.
  static const String initialRoute = '/';

  // Маршрут игры
  static const String gameRoute = '/game';

  // Маршрут окончания игры
  static const String gameOverRoute = '/game_over';

  // Маршрут пользователя
  static const String userRoute = '/user';

  // Маршрут рекордов
  static const String leaderboardRoute = '/leaderboard';

  // Маршруты приложения. Объявляются приватными, чтобы
  // исключить к ним доступ вне навигатора
  static final Map<String, WidgetBuilder> _appRoutes = {
    // Рутовый экран - главное меню
    initialRoute: (_) => const MainMenuScreen(),
    // Экран игры
    gameRoute: (_) => const GameScreen(),
    // Экран окончания игры
    gameOverRoute: (_) => const GameOverScreen(),
    // Экран пользователя
    userRoute: (_) => const UserScreen(),
    // Экран рекордов
    leaderboardRoute: (_) => const LeaderboardScreen(),
  };
}
