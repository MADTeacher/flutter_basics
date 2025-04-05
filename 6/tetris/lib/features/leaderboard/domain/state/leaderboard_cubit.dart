import 'package:flutter/foundation.dart';

import '../i_leaderboard_repository.dart';
import 'leaderboard_state.dart';


/// Класс, использующий паттерн Cubit для управления 
/// состоянием таблицы лидеров. Сами состояния таблицы
/// хранится в ValueNotifier
class LeaderboardCubit {
  final ILeaderboardRepository repository;

  /// Состояние таблицы лидеров
  /// Используем ValueNotifier для отслеживания состояния
  final ValueNotifier<LeaderboardState> stateNotifier =
      ValueNotifier(LeaderboardInitState());

  LeaderboardCubit({required this.repository});

  /// Установка текущего состояния
  void emit(LeaderboardState cubitState) {
    stateNotifier.value = cubitState;
  }

  /// Получение таблицы лидеров
  Future<void> fetchLeaderboard() async {
    // Проверяем текущее состояние
    // Если состояние уже загрузки, то ничего не делаем
    if (stateNotifier.value is LeaderboardLoading) {
      return;
    }

    try {
      emit(const LeaderboardLoading());
      final leaderboard = await repository.fetchLeaderboard();
      emit(LeaderboardSuccessState(leaderboard.toList()));
    } on Object catch (e, stackTrace) {
      emit(LeaderboardErrorState(
        'Ошибка загрузки таблицы лидеров',
        error: e,
        stackTrace: stackTrace,
      ));
    }
  }

  /// Освобождение ресурсов
  /// Закрываем ValueNotifier, чтобы избежать утечек памяти
  void dispose() {
    stateNotifier.dispose();
  }
}
