import 'package:tetris/app/http/base_http_client.dart';
import 'package:tetris/app/http/i_http_client.dart';
import 'package:tetris/app/storage/i_storage_service.dart';
import 'package:tetris/app/storage/storage_service.dart';

import '../../features/user/data/user_repository.dart';
import '../../features/user/domain/i_user_repository.dart';
import '../../features/user/domain/state/user_cubit.dart';
import '../../features/leaderboard/data/leaderboard_repository.dart';
import '../../features/leaderboard/domain/i_leaderboard_repository.dart';

/// Класс синглтон для инициализации зависимостей
/// и предоставления доступа к ним в приложении
class Depends {
  /// Статический экземпляр класса Depends
  /// Используется для создания синглтона
  static final Depends _instance = Depends._internal();

  /// Фабричный метод
  /// для получения экземпляра класса Depends
  factory Depends() {
    return _instance;
  }

  /// Приватный конструктор для
  /// создания экземпляра класса Depends
  Depends._internal();

  /// Метод для инициализации зависимостей
  Future<void> init() async {
    // Инициализируем контейнер зависимостей
    _httpClient = BaseHttpClient();
    // Инициализируем сервис для работы с локальным хранилищем
    storageService = StorageService();
    await storageService.init();

    // Инициализируем репозиторий таблицы лидеров
    leaderRepository = LeaderboardRepository(
      httpClient: _httpClient,
    );

    // Инициализируем репозиторий пользователя
    // Передаем в репозиторий сервис
    // для работы с локальным хранилищем
    _userRepository = UserRepository(
      httpClient: _httpClient,
      storageService: storageService,
    );

    // Инициализируем менеджер состояния пользователя
    userCubit = UserCubit(repository: _userRepository);
    await userCubit.restoreUser();
  }

  late final IStorageService storageService;

  /// Интерфейс HTTP клиента
  late final IHttpClient _httpClient;

  /// Интерфейс репозитория для работы с таблицей лидеров
  late final ILeaderboardRepository leaderRepository;

  /// Интерфейс репозитория для работы с пользователем
  late final IUserRepository _userRepository;

  /// Менеджер состояния пользователя
  late final UserCubit userCubit;
}
