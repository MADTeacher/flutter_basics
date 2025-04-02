import 'package:flutter/widgets.dart';

import '../features/leaderboard/data/leaderboard_repository.dart';
import '../features/leaderboard/domain/i_leaderboard_repository.dart';
import '../features/user/data/user_repository.dart';
import '../features/user/domain/i_user_repository.dart';
import '../features/user/domain/state/user_cubit.dart';
import 'http/base_http_client.dart';
import 'http/i_http_client.dart';

final class DiContainer extends InheritedWidget {
  DiContainer({super.key, required super.child}) {
    // Инициализируем контейнер зависимостей
    _httpClient = BaseHttpClient();
    
    // Инициализируем репозиторий таблицы лидеров
    leaderRepository = LeaderboardRepository(httpClient: _httpClient);

    // Инициализируем репозиторий пользователя
    _userRepository = UserRepository(httpClient: _httpClient);

    // Инициализируем менеджер состояния пользователя
    userCubit = UserCubit(repository: _userRepository);
  }
  /// Интерфейс HTTP клиента
  late final IHttpClient _httpClient;

  /// Интерфейс репозитория для работы с таблицей лидеров
  late final ILeaderboardRepository leaderRepository;

  /// Интерфейс репозитория для работы с пользователем
  late final IUserRepository _userRepository;

  /// Менеджер состояния пользователя
  late final UserCubit userCubit;

  /// Так как контейнер зависимостей нужен только для доступа 
  /// к зависимостям – возвращаем false, чтобы виджеты-потомки 
  /// не перестраивались при изменении контекста 
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  /// Получение контейнера зависимостей из контекста
  static DiContainer of(BuildContext context) {
    // Ищем контейнер зависимостей в контексте
    // Если не нашли, то выбрасываем исключение
    final DiContainer? container =
        context.getInheritedWidgetOfExactType<DiContainer>();
    if (container == null) {
      throw Exception('Контейнер зависимостей не найден в контексте');
    }
    return container;
  }
}
