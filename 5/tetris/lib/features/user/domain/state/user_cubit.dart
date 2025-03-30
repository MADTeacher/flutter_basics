import 'package:flutter/foundation.dart';
import 'package:tetris/features/user/domain/i_user_repository.dart';
import 'package:tetris/features/user/domain/state/user_state.dart';

/// Класс для управления состоянием пользователя
/// и взаимодействия с репозиторием пользователя
class UserCubit {
  final IUserRepository repository;

  UserCubit({required this.repository});

  final ValueNotifier<UserBlocState> stateNotifier =
      ValueNotifier(UserBlocInit());

  Future<void> createUser(String username) async {
    // Проверка состояния, если состояние загрузки, то не выполнять запрос
    // и не перезаписывать состояние
    if (stateNotifier.value is UserBlocLoading) return;

    try {
      // Установка состояния загрузки
      emit(UserBlocLoading());
      // Создание пользователя
      // Если пользователь с таким именем уже существует,
      final entity = await repository.createUser(username);
      // Установка состояния успешной загрузки
      // и передача сущности пользователя
      emit(UserBlocSuccess(entity));
    } on Object catch (error, stackTrace) {
      // Установка состояния ошибки
      // и передача сообщения об ошибке
      emit(UserBlocError('Ошибка создания пользователя',
          error: error, stackTrace: stackTrace));
    }
  }

  /// Установка счета пользователя
  /// [username] - имя пользователя
  /// [scores] - счет пользователя
  Future<void> setScores(String username, int scores) async {
    if (stateNotifier.value is UserBlocLoading) return;

    try {
      emit(UserBlocLoading());
      final entity = await repository.setScores(username, scores);
      emit(UserBlocSuccess(entity));
    } on Object catch (error, stackTrace) {
      emit(UserBlocError(
        'Ошибка обновления результата пользователя',
        error: error,
        stackTrace: stackTrace,
      ));
    }
  }

  /// Выход из аккаунта
  /// Удаление текущего состояния
  void signOut() {
    emit(UserBlocInit());
  }

  /// Сброс состояния кубита
  /// Пригодится для сброса состояния
  /// при повторном входе в аккаунт
  void reset() {
    emit(UserBlocInit());
  }

  /// Установка текущего состояния
  void emit(UserBlocState cubitState) {
    stateNotifier.value = cubitState;
  }
}
