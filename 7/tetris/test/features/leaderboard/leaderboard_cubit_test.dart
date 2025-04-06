import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tetris/features/leaderboard/domain/i_leaderboard_repository.dart';
import 'package:tetris/features/leaderboard/domain/leaderboard_entity.dart';
import 'package:tetris/features/leaderboard/domain/state/leaderboard_cubit.dart';
import 'package:tetris/features/leaderboard/domain/state/leaderboard_state.dart';

import 'leaderboard_cubit_test.mocks.dart';

/// Фейковые данные для тестирования
final List<LeaderboardEntity> _fakeLeaderboard = [
  LeaderboardEntity(id: 1, username: 'User1', score: 100),
  LeaderboardEntity(id: 2, username: 'User2', score: 200),
  LeaderboardEntity(id: 3, username: 'User3', score: 300),
];

/// Генерация моков для ILeaderboardRepository
@GenerateNiceMocks([MockSpec<ILeaderboardRepository>()])
Future<void> main() async {
  late ILeaderboardRepository repository;
  late LeaderboardCubit cubit;

  setUp(() {
    // Инициализация мок репозитория
    repository = MockILeaderboardRepository();
    // Инициализация кубита с мок репозиторием
    cubit = LeaderboardCubit(repository: repository);
  });

  tearDown(() {
    // Освобождение ресурсов
    cubit.dispose();
  });

  group('Тестирование LeaderboardCubit', () {
    test('Проверка получения таблицы лидеров с ошибкой', () async {
      // Проверка, что состояние кубита - LeaderboardInitState
      expect(cubit.stateNotifier.value, isA<LeaderboardInitState>());

      // Имитация метода fetchLeaderboard с ошибкой
      when(repository.fetchLeaderboard()).thenThrow(
        Exception('Ошибка загрузки таблицы лидеров'),
      );

      /// Проверка, что метод fetchLeaderboard не был
      /// завершен успешно
      verifyNever(repository.fetchLeaderboard());

      // Запуск метода fetchLeaderboard
      await cubit.fetchLeaderboard();

      // Проверка, что состояние кубита - LeaderboardErrorState
      expect(
        cubit.stateNotifier.value,
        isA<LeaderboardErrorState>(),
      );
    });

    test('Проверка успешного получения таблицы лидеров', () async {
      // Проверка начального состояния
      expect(cubit.stateNotifier.value, isA<LeaderboardInitState>());

      // Имитация успешного получения таблицы лидеров
      when(repository.fetchLeaderboard()).thenAnswer(
        (_) async => _fakeLeaderboard,
      );

      // Запуск метода
      await cubit.fetchLeaderboard();

      // Проверка, что метод fetchLeaderboard был вызван
      // один раз
      verify(repository.fetchLeaderboard()).called(1);
      // Проверка конечного состояния
      expect(
        cubit.stateNotifier.value,
        isA<LeaderboardSuccessState>(),
      );
      expect(
        (cubit.stateNotifier.value as LeaderboardSuccessState).leaderboard,
        _fakeLeaderboard,
      );
    });

    test('Проверка начального состояния LeaderboardCubit', () {
      // Проверка начального состояния кубита
      expect(cubit.stateNotifier.value, isA<LeaderboardInitState>());
    });
  });
}
