import 'package:flutter/foundation.dart';
import '../i_user_repository.dart';
import 'user_state.dart';

/// Класс для управления состоянием пользователя
/// и взаимодействия с удаленным репозиторием
class UserCubit {
  final IUserRepository repository;

  UserCubit({required this.repository});

  final ValueNotifier<UserState> stateNotifier = ValueNotifier(UserInitState());

  Future<void> createUser(String username) async {
    // Проверка состояния, если состояние загрузки, то не выполнять запрос
    // и не перезаписывать состояние
    if (stateNotifier.value is UserLoadingState) return;

    try {
      // Установка состояния загрузки
      emit(UserLoadingState());
      // Создание пользователя
      // Если пользователь с таким именем уже существует,
      final entity = await repository.createUser(username);
      // Установка состояния успешной загрузки
      // и передача сущности пользователя
      emit(UserSuccessState(entity));
    } on Object catch (error, stackTrace) {
      // Установка состояния ошибки
      // и передача сообщения об ошибке
      emit(UserErrorState('Ошибка создания пользователя',
          error: error, stackTrace: stackTrace));
    }
  }

  /// Установка счета пользователя
  /// [username] - имя пользователя
  /// [scores] - счет пользователя
  Future<void> setScores(String username, int scores) async {
    if (stateNotifier.value is UserLoadingState) return;

    try {
      emit(UserLoadingState());
      final entity = await repository.setScores(username, scores);
      emit(UserSuccessState(entity));
    } on Object catch (error, stackTrace) {
      emit(UserErrorState(
        'Ошибка обновления результата пользователя',
        error: error,
        stackTrace: stackTrace,
      ));
    }
  }

  /// Выход из аккаунта
  /// Удаление текущего состояния
  void signOut() {
    emit(UserInitState());
  }

  /// Сброс состояния кубита
  /// Пригодится для сброса состояния
  /// при повторном входе в аккаунт
  void reset() {
    emit(UserInitState());
  }

  /// Установка текущего состояния
  void emit(UserState cubitState) {
    stateNotifier.value = cubitState;
  }
}
