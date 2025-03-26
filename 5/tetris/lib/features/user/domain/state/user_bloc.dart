import 'package:flutter/foundation.dart';
import 'package:tetris/features/user/domain/repository/i_user_repository.dart';
import 'package:tetris/features/user/domain/state/user_state.dart';

class UserBloc {
  final IUserRepository repository;

  UserBloc({required this.repository});

  final ValueNotifier<UserBlocState> stateNotifier =
      ValueNotifier(UserBlocInit());

  Future<void> createUser(String username) async {
    try {
      emit(UserBlocLoading());
      final entity = await repository.createUser(username);
      emit(UserBlocSuccess(entity));
    } on Object catch (error, stackTrace) {
      emit(UserBlocError('Ошибка создания пользователя',
          error: error, stackTrace: stackTrace));
    }
  }

  Future<void> setScores(String username, int scores) async {
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

  /// Установка текущего состояния
  void emit(UserBlocState cubitState) {
    stateNotifier.value = cubitState;
  }
}
