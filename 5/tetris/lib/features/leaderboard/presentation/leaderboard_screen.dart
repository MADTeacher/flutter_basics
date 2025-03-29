import 'package:flutter/material.dart';
import 'package:tetris/app/context_ext.dart';
import 'package:tetris/features/leaderboard/domain/leaderboard_entity.dart';
import 'package:tetris/features/leaderboard/domain/state/state/leaderboard_cubit.dart';
import 'package:tetris/features/leaderboard/domain/state/state/leaderboard_state.dart';

/// Экран таблицы лидеров
/// Здесь отображается таблица лидеров
class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  /// Объявляем кубит для работы с таблицей лидеров
  late final LeaderboardCubit leaderboardCubit;

  @override
  void initState() {
    super.initState();
    // Инициализируем кубит и получаем таблицу лидеров
    // через репозиторий, который получаем из контейнера зависимостей
    leaderboardCubit = LeaderboardCubit(
      repository: context.di.leaderRepository,
    )..fetchLeaderboard();
  }

  @override
  Widget build(BuildContext context) {
    // Получаем состояние кубита через ValueListenableBuilder
    final state = leaderboardCubit.stateNotifier.value;
    // Используем ValueListenableBuilder
    // для отслеживания изменений состояния
    // и перестраиваем виджет при изменении состояния кубита
    return ValueListenableBuilder(
      valueListenable: leaderboardCubit.stateNotifier,
      builder: (context, value, child) => switch (state) {
        // Инициализация состояния
        LeaderboardInitState() => const Center(child: Text('Инициализация...')),
        // Загрузка состояния
        // Здесь можно добавить анимацию загрузки или что-то подобное
        LeaderboardLoading() =>
          const Center(child: CircularProgressIndicator()),
        // Успешное состояние
        // Здесь отображаем таблицу лидеров
        LeaderboardSuccessState() => ListView.builder(
            itemCount: state.leaderboard.length,
            itemBuilder: (context, index) {
              final LeaderboardEntity item = state.leaderboard[index];
              return ListTile(
                title: Text(item.username),
                subtitle: Text('Очки: ${item.score}'),
              );
            },
          ),
        // Ошибка состояния
        // Здесь можно добавить обработку ошибок
        LeaderboardErrorState() => Center(
            child: Text(
              'Ошибка: ${state.message}',
              style: const TextStyle(color: Colors.red),
            ),
          ),
      },
    );
  }

  @override
  void dispose() {
    // При завершении работы виджета
    // освобождаем ресурсы кубита
    leaderboardCubit.dispose();
    super.dispose();
  }
}
