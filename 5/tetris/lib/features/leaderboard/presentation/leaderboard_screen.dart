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
    // Используем ValueListenableBuilder
    // для отслеживания изменений состояния
    // и перестраиваем виджет при изменении состояния кубита
    return Scaffold(
      appBar: AppBar(
        title: const Text('Таблица лидеров'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Обновляем таблицу лидеров при нажатии на кнопку
              leaderboardCubit.fetchLeaderboard();
            },
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: leaderboardCubit.stateNotifier,
        builder: (context, state, child) => switch (state) {
          // Инициализация состояния
          LeaderboardInitState() =>
            const Center(child: Text('Инициализация...')),
          // Загрузка состояния
          // Здесь можно добавить анимацию загрузки или что-то подобное
          LeaderboardLoading() =>
            const Center(child: CircularProgressIndicator()),
          // Успешное состояние
          // Здесь отображаем таблицу лидеров
          LeaderboardSuccessState() => _ListRecords(state.leaderboard),
          // Ошибка состояния
          // Здесь можно добавить обработку ошибок
          LeaderboardErrorState() => Center(
              child: Text(
                'Ошибка: ${state.message}',
                style: const TextStyle(color: Colors.red),
              ),
            ),
        },
      ),
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

/// Виджет для отображения списка записей таблицы лидеров
class _ListRecords extends StatelessWidget {
  const _ListRecords(this.leaderboard);

  final List<LeaderboardEntity> leaderboard;

  @override
  Widget build(BuildContext context) {
    // Проверяем, есть ли записи в таблице лидеров
    if (leaderboard.isEmpty) {
      return const Center(child: Text('Нет записей в таблице лидеров'));
    }

    return ListView.builder(
      itemCount: leaderboard.length,
      itemBuilder: (context, index) {
        final LeaderboardEntity item = leaderboard[index];
        return ListTile(
          title: Text(item.username),
          subtitle: Text('Очки: ${item.score}'),
        );
      },
    );
  }
}
