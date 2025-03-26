import 'package:flutter/material.dart';
import 'package:tetris/features/http/i_http_client.dart';
import 'package:tetris/features/http/my_http_client.dart';
import 'package:tetris/features/leaderboard/data/repository/leaderboard_repository.dart';
import 'package:tetris/features/leaderboard/domain/repository/i_leaderboard_repository.dart';
import 'package:tetris/features/leaderboard/domain/state/leaderboard_bloc.dart';
import 'package:tetris/features/user/data/repository/user_repository.dart';
import 'package:tetris/features/user/domain/repository/i_user_repository.dart';
import 'package:tetris/features/user/domain/state/user_bloc.dart';

/// Контейнер зависимостей
final class DiContainer extends InheritedWidget {
  DiContainer({super.key, required super.child}) {
    _httpClient = MyHttpClient();
    _leaderRepository = LeaderboardRepository(httpClient: _httpClient);
    leaderboardBloc = LeaderboardBloc(repository: _leaderRepository);
    _userRepository = UserRepository(httpClient: _httpClient);
    userBloc = UserBloc(repository: _userRepository);
  }
  late final IHttpClient _httpClient;
  late final ILeaderboardRepository _leaderRepository;
  late final IUserRepository _userRepository;

  late final LeaderboardBloc leaderboardBloc;
  late final UserBloc userBloc;

  /// Возвращаем false, чтобы виджеты-потомки не перестраивались при изменении контекста
  /// Так как контейнер зависимостей нужен только для доступа к зависимостям
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  /// Получение контейнера зависимостей из контекста
  static DiContainer of(BuildContext context) {
    final DiContainer? container =
        context.getInheritedWidgetOfExactType<DiContainer>();
    if (container == null) {
      throw Exception('Контейнер зависимостей не найден в контексте');
    }
    return container;
  }
}
